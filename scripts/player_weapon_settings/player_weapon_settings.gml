function player_weapon_settings() {
	enum weapons {
		// Default
		x_buster,
		z_buster,
		z_saber,
		a_pistol,
		vile_vulcan,
		mega_buster,
		// X
		storm_tornado,
		homing_torpedo,
		hyper_charge,
		falcon_giga,
		x2_giga_crush,
		nova_strike,
		// Zero
		messenko,
		z_buster_x5,
		nightmare_saber,
		// Axl
		a_ray_gun,
		// I aint workin on bass no more. doc is trying his hand at that, let him have his fun
		bass_buster,
		// Mega Man
		copy_vision,
		speed_gear,
		power_gear,
		lightning_bolt,
		//bitchin, 88 weapons to add
		rolling_cutter,
		super_arm,
		ice_slasher,
		hyper_bomb,
		fire_storm,
		thunder_beam,
		time_slow,
		oil_slider,
		//mm2
		metal_blade,
		atomic_fire,
		bubble_lead,
		crash_bomb,
		air_shooter,
		quick_boomerang,
		time_stopper,
		leaf_shield,
		//mm3
		needle_shot,
		gemini_laser,
		hard_knuckle,
		search_snake,
		spark_shot,
		magnet_missile,
		top_spin,
		shadow_blade,
		//mm4
		pharoah_shot,
		rain_flush,
		skull_barrier,
		dust_crusher,
		ring_boomerang,
		flash_stopper,
		drill_bomb,
		dive_missile,
		//utility - might make this universal
		magnet_beam,
		item_1,
		item_2,
		item_3,
		wire,
		balloon
	}
	// Must be changed to struct array
	for (var i = 80; i >= 0; i--) {
		weapon_palettes[i] = plt_index_default;
		weapon_icon[i] = noone;
		weapon_color[i] = 0;
		weapon_sprite_name[i] = "";
		weapon_shots_limit[i] = 1;
		weapon_show[i] = true;
		weapon_energy[i] = 28;
		weapon_energy_max[i] = 28;
		weapon_max_level[i] = 3;
		weapon_costs[i] = [1, 1, 1, 2, 2, 2];
		weapon_auto_charge[i] = false;
		weapon_damage_refill[i] = 0;
		weapon_fill_rate[i] = 0;
		weapons_script[i] = noone;
		weapon_selectable[i] = true;
		weapon_full_sound[i] = noone;
		weapon_refill_enabled[i] = true;
		weapon_level_id[i] = 0; // Use this for weapons that use the same script and only changes the shot or its properties
	}
	// Palettes
	weapon_palettes[weapons.storm_tornado] = 6;
	weapon_palettes[weapons.homing_torpedo] = 9;
	weapon_palettes[weapons.copy_vision] = 13;
	weapon_palettes[weapons.lightning_bolt] = 15;
	//mm1
	weapon_palettes[weapons.rolling_cutter] = 16;
	weapon_palettes[weapons.super_arm] = 17;
	weapon_palettes[weapons.ice_slasher] = 18;
	weapon_palettes[weapons.hyper_bomb] = 19;
	weapon_palettes[weapons.fire_storm] = 20;
	weapon_palettes[weapons.thunder_beam] = 21;
	weapon_palettes[weapons.time_slow] = 22;
	weapon_palettes[weapons.oil_slider] = 23;
	//mm2
	weapon_palettes[weapons.metal_blade] = 24;
	weapon_palettes[weapons.time_stopper] = 25;
	weapon_palettes[weapons.bubble_lead] = 26;
	weapon_palettes[weapons.air_shooter] = 27;
	weapon_palettes[weapons.quick_boomerang] = 28;
	weapon_palettes[weapons.crash_bomb] = 29;
	weapon_palettes[weapons.atomic_fire] = 30;
	weapon_palettes[weapons.leaf_shield] = 31;
	weapon_palettes[weapons.item_1] = 32;
	//mm3
	weapon_palettes[weapons.needle_shot] = 33;
	weapon_palettes[weapons.gemini_laser] = 34;
	weapon_palettes[weapons.hard_knuckle] = 35;
	weapon_palettes[weapons.magnet_missile] = 36;
	weapon_palettes[weapons.shadow_blade] = 37;
	weapon_palettes[weapons.spark_shot] = 38;
	weapon_palettes[weapons.search_snake] = 39;
	weapon_palettes[weapons.top_spin] = 40;
	//mm4
	weapon_palettes[weapons.flash_stopper] = 41;
	weapon_palettes[weapons.rain_flush] = 42;
	weapon_palettes[weapons.dive_missile] = 43;
	weapon_palettes[weapons.skull_barrier] = 44;
	weapon_palettes[weapons.ring_boomerang] = 45;
	weapon_palettes[weapons.pharoah_shot] = 46;
	weapon_palettes[weapons.drill_bomb] = 47;
	weapon_palettes[weapons.dust_crusher] = 48;
	// Bar Icons
	weapon_icon[weapons.storm_tornado] = 0;
	weapon_icon[weapons.homing_torpedo] = 5;
	weapon_icon[weapons.messenko] = 1;
	weapon_icon[weapons.vile_vulcan] = 2;
	weapon_icon[weapons.hyper_charge] = 3;
	weapon_icon[weapons.falcon_giga] = 2;
	weapon_icon[weapons.x2_giga_crush] = 4;
	weapon_icon[weapons.nova_strike] = 2;
	weapon_icon[weapons.copy_vision] = 6;
	weapon_icon[weapons.dive_missile] = 7;
	weapon_icon[weapons.lightning_bolt] = 8;
	//mm1
	weapon_icon[weapons.rolling_cutter] = 2;
	weapon_icon[weapons.fire_storm] = 2;
	weapon_icon[weapons.ice_slasher] = 2;
	weapon_icon[weapons.super_arm] = 2;
	weapon_icon[weapons.thunder_beam] = 2;
	weapon_icon[weapons.hyper_bomb] = 2;
	weapon_icon[weapons.oil_slider] = 2;
	weapon_icon[weapons.time_slow] = 2;
	weapon_icon[weapons.magnet_beam] = 2;
	//mm2
	weapon_icon[weapons.atomic_fire] = 2;
	weapon_icon[weapons.metal_blade] = 2;
	weapon_icon[weapons.crash_bomb] = 2;
	weapon_icon[weapons.leaf_shield] = 2;
	weapon_icon[weapons.air_shooter] = 2;
	weapon_icon[weapons.time_stopper] = 2;
	weapon_icon[weapons.bubble_lead] = 2;
	weapon_icon[weapons.quick_boomerang] = 2;
	//mm3
	weapon_icon[weapons.shadow_blade] = 2;
	weapon_icon[weapons.top_spin] = 2;
	weapon_icon[weapons.spark_shot] = 2;
	weapon_icon[weapons.search_snake] = 2;
	weapon_icon[weapons.gemini_laser] = 2;
	weapon_icon[weapons.needle_shot] = 2;
	weapon_icon[weapons.magnet_missile] = 2;
	weapon_icon[weapons.hard_knuckle] = 2;
	//mm4
	weapon_icon[weapons.rain_flush] = 2;
	weapon_icon[weapons.flash_stopper] = 2;
	weapon_icon[weapons.ring_boomerang] = 2;
	weapon_icon[weapons.dust_crusher] = 2;
	weapon_icon[weapons.drill_bomb] = 2;
	weapon_icon[weapons.pharoah_shot] = 2;
	weapon_icon[weapons.skull_barrier] = 2;
	// Bar color (Image Index)
	weapon_color[weapons.storm_tornado] = 1;
	weapon_color[weapons.homing_torpedo] = 3;
	weapon_color[weapons.dive_missile] = 5;
	weapon_color[weapons.lightning_bolt] = 6;
	weapon_color[weapons.copy_vision] = 4;
	weapon_color[weapons.messenko] = 2;
	weapon_color[weapons.vile_vulcan] = 1;
	// Sprite Names
	weapon_sprite_name[weapons.a_pistol] = "pistol";
	weapon_sprite_name[weapons.a_ray_gun] = "ray";
	// Shots Limit
	weapon_shots_limit[weapons.x_buster] = 3;
	weapon_shots_limit[weapons.z_buster] = 3;
	weapon_shots_limit[weapons.a_pistol] = 200;
	weapon_shots_limit[weapons.bass_buster] = 200;
	weapon_shots_limit[weapons.a_ray_gun] = 200;
	weapon_shots_limit[weapons.vile_vulcan] = 10;
	weapon_shots_limit[weapons.hyper_charge] = 2;
	weapon_shots_limit[weapons.homing_torpedo] = 2;
	weapon_shots_limit[weapons.storm_tornado] = 1;
	weapon_shots_limit[weapons.mega_buster] = 3;
	weapon_shots_limit[weapons.copy_vision] = 4;
	weapon_shots_limit[weapons.dive_missile] = 1;
	weapon_shots_limit[weapons.lightning_bolt] = 1;
	weapon_shots_limit[weapons.fire_storm] = 2;
	weapon_shots_limit[weapons.bubble_lead] = 2;
	weapon_shots_limit[weapons.atomic_fire] = 2;
	weapon_shots_limit[weapons.ice_slasher] = 3;
	weapon_shots_limit[weapons.crash_bomb] = 3;
	weapon_shots_limit[weapons.metal_blade] = 69;//this one was to be funny
	weapon_shots_limit[weapons.quick_boomerang] = 69;//this one was because im lazy
	weapon_shots_limit[weapons.needle_shot] = 69;//this one was because im lazy
	// Show
	weapon_show[weapons.x_buster] = false;
	weapon_show[weapons.z_buster] = false;
	weapon_show[weapons.a_pistol] = false;
	weapon_show[weapons.bass_buster] = false;
	weapon_show[weapons.z_saber] = false;
	weapon_show[weapons.mega_buster] = false;
	weapon_show[weapons.falcon_giga] = false;
	// Cost
	weapon_costs[weapons.x_buster] = [0];
	weapon_costs[weapons.z_buster] = [0];
	weapon_costs[weapons.bass_buster] = [0];
	weapon_costs[weapons.z_buster_x5] = [0];
	weapon_costs[weapons.nightmare_saber] = [0];
	weapon_costs[weapons.a_pistol] = [0];
	weapon_costs[weapons.a_ray_gun] = [0];
	weapon_costs[weapons.mega_buster] = [0];
	weapon_costs[weapons.messenko] = [7];
	weapon_costs[weapons.hyper_charge] = [4];
	weapon_costs[weapons.nova_strike] = [0];
	weapon_costs[weapons.falcon_giga] = [-1];
	weapon_costs[weapons.x2_giga_crush] = [-1];
	weapon_costs[weapons.speed_gear] = [(28/60) / 256]; // Use for 5 seconds
	weapon_costs[weapons.power_gear] = [(28/60) / 5]; // Use for 5 seconds
	weapon_costs[weapons.lightning_bolt] = [4];
	weapon_costs[weapons.metal_blade] = [1/8];
	weapon_costs[weapons.quick_boomerang] = [1/8];
	weapon_costs[weapons.needle_shot] = [1/8];
	// Weapon Limit
	weapon_energy_max[weapons.vile_vulcan] = 16;
	// Max Level
	weapon_max_level[weapons.x_buster] = infinity;
	weapon_max_level[weapons.z_buster] = infinity;
	weapon_max_level[weapons.mega_buster] = infinity;
	weapon_max_level[weapons.hyper_charge] = 0;
	// Auto Charge
	weapon_auto_charge[weapons.hyper_charge] = true;
	// Refill by Hit
	weapon_damage_refill[weapons.hyper_charge] = 1;
	weapon_damage_refill[weapons.falcon_giga] = 4;
	weapon_damage_refill[weapons.x2_giga_crush] = 3;
	// Weapon Level ID
	weapon_level_id[weapons.a_ray_gun] = 1;
	// Fill Rate
	weapon_fill_rate[weapons.vile_vulcan] = 0.1;
	weapon_fill_rate[weapons.speed_gear] = (28/60) / 1;//15
	weapon_fill_rate[weapons.power_gear] = (28/60) / 15;
	// Full Sound
	weapon_full_sound[weapons.x2_giga_crush] = snd_player_full_weapon;
	weapon_full_sound[weapons.falcon_giga] = snd_player_full_weapon;
	weapon_full_sound[weapons.speed_gear] = noone;
	weapon_full_sound[weapons.power_gear] = noone;
	// Selectable
	weapon_selectable[weapons.z_saber] = false;
	weapon_selectable[weapons.nova_strike] = false;
	weapon_selectable[weapons.falcon_giga] = false;
	weapon_selectable[weapons.speed_gear] = false;
	weapon_selectable[weapons.power_gear] = false;
	// Scripts
	weapons_script[weapons.x_buster] = player_x_buster_x2;
	weapons_script[weapons.z_buster] = player_zero_buster_x1;
	weapons_script[weapons.storm_tornado] = player_x_storm_tornado;
	weapons_script[weapons.homing_torpedo] = player_x_homing_torpedo;
	weapons_script[weapons.a_pistol] = player_axl_pistol;
	weapons_script[weapons.bass_buster] = player_bass_buster;
	weapons_script[weapons.a_ray_gun] = player_axl_pistol;
	weapons_script[weapons.vile_vulcan] = player_vile_vulcan;
	weapons_script[weapons.hyper_charge] = player_x_hyper_charge;
	weapons_script[weapons.z_buster_x5] = player_zero_buster_x5;
	weapons_script[weapons.nightmare_saber] = player_zero_nightmare_saber;
	//megaman
	weapons_script[weapons.mega_buster] = player_megaman_buster;
	weapons_script[weapons.copy_vision] = player_megaman_copy_vision;
	weapons_script[weapons.lightning_bolt] = player_megaman_lightning_bolt;
	//mm1
	weapons_script[weapons.rolling_cutter] = player_megaman_rolling_cutter;
	weapons_script[weapons.fire_storm] = player_megaman_fire_storm;
	weapons_script[weapons.super_arm] = player_megaman_super_arm;
	weapons_script[weapons.ice_slasher] = player_megaman_ice_slasher;
	weapons_script[weapons.thunder_beam] = player_megaman_thunder_beam;
	weapons_script[weapons.hyper_bomb] = player_megaman_hyper_bomb;
	weapons_script[weapons.oil_slider] = player_megaman_oil_slider;
	weapons_script[weapons.time_slow] = player_megaman_time_slow;
	weapons_script[weapons.magnet_beam] = player_megaman_magnet_beam;
	//mm2
	weapons_script[weapons.metal_blade] = player_megaman_metal_blade;
	weapons_script[weapons.atomic_fire] = player_megaman_atomic_fire;
	weapons_script[weapons.leaf_shield] = player_megaman_leaf_shield;
	weapons_script[weapons.quick_boomerang] = player_megaman_quick_boomerang;
	weapons_script[weapons.crash_bomb] = player_megaman_crash_bomb;
	weapons_script[weapons.bubble_lead] = player_megaman_bubble_lead;
	weapons_script[weapons.time_stopper] = player_megaman_time_stopper;
	weapons_script[weapons.air_shooter] = player_megaman_air_shooter;
	//mm3
	weapons_script[weapons.shadow_blade] = player_megaman_shadow_blade;
	weapons_script[weapons.top_spin] = player_megaman_top_spin;
	weapons_script[weapons.gemini_laser] = player_megaman_gemini_laser;
	weapons_script[weapons.hard_knuckle] = player_megaman_hard_knuckle;
	weapons_script[weapons.spark_shot] = player_megaman_spark_shot;
	weapons_script[weapons.search_snake] = player_megaman_search_snake;
	weapons_script[weapons.needle_shot] = player_megaman_needle_cannon;
	weapons_script[weapons.magnet_missile] = player_megaman_magnet_missile;
	//mm4
	weapons_script[weapons.dive_missile] = player_megaman_dive_missile;
	weapons_script[weapons.ring_boomerang] = player_megaman_ring_boomerang;
	weapons_script[weapons.drill_bomb] = player_megaman_drill_bomb;
	weapons_script[weapons.rain_flush] = player_megaman_rain_flush;
	weapons_script[weapons.flash_stopper] = player_megaman_flash_stopper;
	weapons_script[weapons.dust_crusher] = player_megaman_dust_crusher;
	weapons_script[weapons.pharoah_shot] = player_megaman_pharoah_shot;
	weapons_script[weapons.skull_barrier] = player_megaman_skull_barrier;
}
