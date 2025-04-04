local mod = get_mod("AutoPing")

local is_tagging = false
local cooldown_timer = 0.0
local current_target = nil
local manual_override = false

mod:hook("SmartTag", "destroy", function(original_func, self, ...)
	local player_unit = Managers.player:local_player_safe(1).player_unit
	
	if self._tagger_unit == player_unit and current_target == self._target_unit then
		if mod:get("refresh") then
			cooldown_timer = 0
		end
		manual_override = false
	end
	
	return original_func(self, ...)
end)

mod:hook_safe("SmartTag", "validate_target_unit", function(target_unit)
	local target_type = Unit.get_data(target_unit, "smart_tag_target_type")
	local unit_extension = ScriptUnit.has_extension(target_unit, "unit_data_system")
	local breed_data = unit_extension and unit_extension:breed()
	local breed_name = breed_data and breed_data.name and string.lower(breed_data.name) or ""

	-- Define enemy types eligible for auto-ping
	local enemy_types = {
		"chaos_armored_infected",
		"chaos_beast_of_nurgle",
		"chaos_daemonhost",
		"chaos_hound",
		"chaos_hound_mutator",
		"chaos_lesser_mutated_poxwalker",
		"chaos_mutated_poxwalker",
		"chaos_mutator_daemonhost",
		"chaos_mutator_ritualist",
		"chaos_newly_infected",
		"chaos_ogryn_bulwark",
		"chaos_ogryn_executor",
		"chaos_ogryn_gunner",
		"chaos_plague_ogryn",
		"chaos_poxwalker_bomber",
		"chaos_poxwalker",
		"chaos_spawn",
		"cultist_assault",
		"cultist_berzerker",
		"cultist_captain",
		"cultist_flamer",
		"cultist_grenadier",
		"cultist_gunner",
		"cultist_melee",
		"cultist_mutant",
		"cultist_mutant_mutator",
		"cultist_ritualist",
		"cultist_shocktrooper",
		"renegade_assault",
		"renegade_berzerker",
		"renegade_captain",
		"renegade_executor",
		"renegade_flamer",
		"renegade_grenadier",
		"renegade_gunner",
		"renegade_melee",
		"renegade_netgunner",
		"renegade_rifleman",
		"renegade_shocktrooper",
		"renegade_sniper",
		"renegade_twin_captain",
		"renegade_twin_captain_two",
		"human_breed",
		"ogryn_breed",
	}

	local can_ping = false
	for _, enemy in ipairs(enemy_types) do
		if mod:get("enemy_type_" .. enemy) and string.find(breed_name, string.lower(enemy)) then
			can_ping = true
			break
		end
	end

	if not can_ping then
		is_tagging = false
		return
	end

	if target_type == "breed" and target_unit ~= current_target and cooldown_timer <= 0 and not manual_override then
		is_tagging = true
	elseif target_type == "pickup" then
		is_tagging = false
	end
end)

mod:hook_safe("SmartTag", "init", function(self, tag_id, template, tagger_unit, target_unit, ...)
	if cooldown_timer > 0.5 and not mod:get("manualoverride") then
		manual_override = true
	end

	if tagger_unit == Managers.player:local_player_safe(1).player_unit then
		cooldown_timer = 0
		is_tagging = false
		current_target = target_unit
	end
end)

mod:hook("InputService", "_get", function(original_func, self, action_name)
	if cooldown_timer <= 0 and is_tagging and action_name == "smart_tag" then
		cooldown_timer = mod:get("cd")
		return true
	end
	return original_func(self, action_name)
end)

function mod.update(delta_time)
	if cooldown_timer > 0 then
		cooldown_timer = cooldown_timer - delta_time
	end
end
