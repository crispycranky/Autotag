local mod = get_mod("AutoPing")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	allow_rehooking = true,
	options = {
		widgets = {
			{
				setting_id = "cd",
				type = "numeric",
				default_value = 10,
				range = {2, 10},
				decimals_number = 1,
			},
			{
				setting_id = "manualoverride",
				type = "checkbox",
				default_value = false
			},
			{
				setting_id = "refresh",
				type = "checkbox",
				default_value = true
			},
			-- Enemy Breed Checkboxes --
			{
				setting_id = "enemy_type_chaos_armored_infected",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Armored Infected",
			},
			{
				setting_id = "enemy_type_chaos_beast_of_nurgle",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Beast of Nurgle",
			},
			{
				setting_id = "enemy_type_chaos_daemonhost",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Daemonhost",
			},
			{
				setting_id = "enemy_type_chaos_hound",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Hound",
			},
			{
				setting_id = "enemy_type_chaos_hound_mutator",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Hound Mutator",
			},
			{
				setting_id = "enemy_type_chaos_lesser_mutated_poxwalker",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Lesser Mutated Poxwalker",
			},
			{
				setting_id = "enemy_type_chaos_mutated_poxwalker",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Mutated Poxwalker",
			},
			{
				setting_id = "enemy_type_chaos_mutator_daemonhost",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Mutator Daemonhost",
			},
			{
				setting_id = "enemy_type_chaos_mutator_ritualist",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Mutator Ritualist",
			},
			{
				setting_id = "enemy_type_chaos_newly_infected",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Newly Infected",
			},
			{
				setting_id = "enemy_type_chaos_ogryn_bulwark",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Ogryn Bulwark",
			},
			{
				setting_id = "enemy_type_chaos_ogryn_executor",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Ogryn Executor",
			},
			{
				setting_id = "enemy_type_chaos_ogryn_gunner",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Ogryn Gunner",
			},
			{
				setting_id = "enemy_type_chaos_plague_ogryn",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Plague Ogryn",
			},
			{
				setting_id = "enemy_type_chaos_poxwalker_bomber",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Poxwalker Bomber",
			},
			{
				setting_id = "enemy_type_chaos_poxwalker",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Poxwalker",
			},
			{
				setting_id = "enemy_type_chaos_spawn",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Chaos Spawn",
			},
			{
				setting_id = "enemy_type_cultist_assault",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Cultist Assault",
			},
			{
				setting_id = "enemy_type_cultist_berzerker",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Cultist Berzerker",
			},
			{
				setting_id = "enemy_type_cultist_captain",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Cultist Captain",
			},
			{
				setting_id = "enemy_type_cultist_flamer",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Cultist Flamer",
			},
			{
				setting_id = "enemy_type_cultist_grenadier",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Cultist Grenadier",
			},
			{
				setting_id = "enemy_type_cultist_gunner",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Cultist Gunner",
			},
			{
				setting_id = "enemy_type_cultist_melee",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Cultist Melee",
			},
			{
				setting_id = "enemy_type_cultist_mutant",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Cultist Mutant",
			},
			{
				setting_id = "enemy_type_cultist_mutant_mutator",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Cultist Mutant Mutator",
			},
			{
				setting_id = "enemy_type_cultist_ritualist",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Cultist Ritualist",
			},
			{
				setting_id = "enemy_type_cultist_shocktrooper",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Cultist Shocktrooper",
			},
			{
				setting_id = "enemy_type_renegade_assault",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Assault",
			},
			{
				setting_id = "enemy_type_renegade_berzerker",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Berzerker",
			},
			{
				setting_id = "enemy_type_renegade_captain",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Captain",
			},
			{
				setting_id = "enemy_type_renegade_executor",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Executor",
			},
			{
				setting_id = "enemy_type_renegade_flamer",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Flamer",
			},
			{
				setting_id = "enemy_type_renegade_grenadier",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Grenadier",
			},
			{
				setting_id = "enemy_type_renegade_gunner",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Gunner",
			},
			{
				setting_id = "enemy_type_renegade_melee",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Melee",
			},
			{
				setting_id = "enemy_type_renegade_netgunner",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Netgunner",
			},
			{
				setting_id = "enemy_type_renegade_rifleman",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Rifleman",
			},
			{
				setting_id = "enemy_type_renegade_shocktrooper",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Shocktrooper",
			},
			{
				setting_id = "enemy_type_renegade_sniper",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Sniper",
			},
			{
				setting_id = "enemy_type_renegade_twin_captain",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Twin Captain",
			},
			{
				setting_id = "enemy_type_renegade_twin_captain_two",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Renegade Twin Captain Two",
			},
			{
				setting_id = "enemy_type_human_breed",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Human",
			},
			{
				setting_id = "enemy_type_ogryn_breed",
				type = "checkbox",
				default_value = true,
				ui_name = "Tag Ogryn",
			},
		}
	}
}
