function Weapon() constructor
{
    palette = 0;//this should be plt_index_default but because the weapon constructor is
	icon = 2;//   accesible anywhere you dont have consistent access to plt_index_default,
	color = 0;//  nor is it consistent that it serves the same purpose
	sprite_name = "";
	shot_limit = 1;
	show = true;
	energy_max = 28;
	max_level = 3;
	costs = [1, 1, 1, 2, 2, 2];
	auto_charge = false;
	damage_refill = 0;
	fill_rate = 0;
	selectable = true;
	code = player_x_buster_x1;
	full_sound = noone;
	refill_enabled = true;
	level_id = 0;
	name = "unnasigned";
	
	static set_palette = function(_pal) { palette = _pal; }
	static set_icon = function(_icon) { icon = _icon; }
	static set_color = function(_col) { color = _col; }
	static set_sprite_name = function(_name) { sprite_name = _name; }
	static set_shot_limit = function(_lim) { shot_limit = _lim; }
	static set_show = function(_show) { show = _show; }
	static set_max_energy = function(_max) { energy_max = _max; }
	static set_max_level = function(_max) { max_level = _max; }
	static set_costs = function(_costs) { costs = _costs; }
	static set_auto_charge = function(_auto) { auto_charge = _auto; }
	static set_damage_refill = function(_refill) { damage_refill = _refill; }
	static set_fill_rate = function(_rate) { fill_rate = _rate; }
	static set_selectable = function(_selectable) { selectable = _selectable; }
	//this one is special because if you dont have the string it returns an ID
	//and i cant use ids to call scripts
	static set_code = function(_code) { code = _code;}
	static get_script = function() { return code;}
	static set_full_sound = function(_sound) { full_sound = _sound; }
	static set_refill_enabled = function(_enabled) { refill_enabled = _enabled; }
	static set_level_id = function(_id) { level_id = _id; }
	static set_name = function(_name) { name = _name; }
}

function WeaponSlot() constructor {
	energy = 28;
	selectable = true;
	weapon = WEAPONS.x_buster;//its just the x buster for testing purposes
	refill_enabled = true;
	
	static set_energy = function(_energy) { energy = _energy; }
	static set_refill = function(_ref) { refill_enabled = _ref; }
	static set_selectable = function(_selectable) { selectable = _selectable; }
	static get_selectable = function() { return selectable; }
	static get_refill = function() { return refill_enabled; }
	static set_weapon = function(_wep) { weapon = _wep; }
	static get_weapon = function() { return weapon; }
	static find_energy = function() {return energy; }
}

function WeaponSlotManager() constructor {
	//ds lists cant do structs? wtf
	weapons = [];
	
	start = function(){
		add_weapon(WEAPONS.x_buster, 0);
	}
	
	add_weapon = function(_wep = WEAPONS.x_buster, _slot = array_length(weapons)){
		var _new_weapon = new WeaponSlot();
		
		_new_weapon.set_weapon(_wep);
		
		weapons[_slot] = _new_weapon;
	}
	
	set_energy = function(_wep,_nrg){
		for(var e = 0; e < array_length(weapons); e++){
			if(weapons[e] != 0){
				if(_wep == weapons[e].weapon){
					//log(string(e) + ", " + string(_wep) + " goddammit")
					weapons[e].set_energy(_nrg)
				}
			}
		}
	}
	set_refill = function(_wep,_nrg){
		for(var e = 0; e < array_length(weapons); e++){
			if(weapons[e] != 0){
				if(_wep == weapons[e].weapon){
					//log(string(e) + ", " + string(_wep) + " goddammit")
					weapons[e].set_refill(_nrg)
				}
			}
		}
	}
	
	set_enabled = function(_wep, _enabled){
		//i deprecated ds lists yesterday i must have forgor this
		//ds_list_find_index(weapons, _wep).set_selectable(_enabled)
	}
	
	get_energy = function(_wep){
		for(var e = 0; e < array_length(weapons); e++){
			//(string(weapons[e]) + ", " + string(e))
			if(weapons[e] != 0){
				if(_wep == weapons[e].weapon){
					//(string(e) + ", " + string(_wep) + ", i am the succ of energy")
					//im still mad i cant use ds lists ):<
					//but i can settle with arrays. they
					//work almost as well
					//(weapons[e].find_energy())
					return weapons[e].find_energy();
				}
			}
		}
		//log("end of loop i guess")
		return 0;
	}
	
	get_enabled = function(_wep){
		for(var e = 0; e < array_length(weapons); e++){
			if(weapons[e] != 0){
				if(_wep == weapons[e].weapon){
					//(string(e) + ", " + string(_wep) + ", " + string(weapons[e].get_selectable()))
					return weapons[e].get_selectable();
				}
			}
		}
	}
	
	locate_energy = function(_wep){
		for(var e = 0; e < array_length(weapons); e++){
			//log(string(_wep) + ", " + string(weapons[e].weapon) + ", " + string(_wep == weapons[e].weapon))
			if(weapons[e].weapon == _wep)
				return weapons[e].find_energy();
		}
		//fuck you, kill yourself. 
		return undefined;
	}
	
	get_exists = function(_wep){
		for(var e = 0; e < array_length(weapons); e++){
			if(weapons[e].weapon == _wep)
				return true;
		}
		return false;
	}
	
	get_weapon = function(_wep){
		for(var e = 0; e < array_length(weapons); e++){
			if(weapons[e] != 0){
				if(weapons[e].weapon == _wep)
					return weapons[e].get_weapon();
			}
		}
		return undefined;
	}
	
	raw_weapon = function(_wep){
		return weapons[_wep].get_weapon();
	}
	
	step = function(){
		
	}
}

function player_weapon_settings() {
	// this needs to have seperate stuff from the global stuff. global doesnt change, this does.
}

function global_weapon_Settings(){
	enum WEAPONS {
		mega_buster,copy_vision,speed_gear,power_gear,lightning_bolt,snow_drift,
		//mm1
		rolling_cutter,super_arm,ice_slasher,hyper_bomb,fire_storm,thunder_beam,time_slow,oil_slider,
		//mm2
		metal_blade,atomic_fire,bubble_lead,crash_bomb,air_shooter,quick_boomerang,time_stopper,leaf_shield,
		//mm3
		needle_shot,gemini_laser,hard_knuckle,search_snake,spark_shot,magnet_missile,top_spin,shadow_blade,
		//mm4
		pharoah_shot,rain_flush,skull_barrier,dust_crusher,ring_boomerang,flash_stopper,drill_bomb,dive_missile,
		//mm5
		gravity_hold,water_wave,power_stone,gyro_attack,star_crash,charge_kick,napalm_bomb,crystal_eye,
		//mm6 - im gonna stop here for the moment, the mm7 WEAPONS arent quite completed and the mm8 WEAPONS arent even touched
		blizzard_attack,centaur_flash,flame_blast,knight_crusher,plant_barrier,silver_tomahawk,wind_storm,yamato_spear,
		//utility - might make this universal
		magnet_beam,item_1,item_2,item_3,wire,balloon,
		// Default
		x_buster,z_buster,z_saber,a_pistol,vile_vulcan,
		// X1
		storm_tornado,homing_torpedo,
		// gigas
		hyper_charge,falcon_giga,x2_giga_crush,nova_strike,
		// Zero
		messenko,z_buster_x5,nightmare_saber,
		// Axl
		a_ray_gun,
		length
	}
	// dark: Must be changed to struct array
	// forte: yeah this shit is ass
	// what about ds lists? arent those resizable and way better than arrays anyways?
	// structs look solid, i just need to figure out how tf you make a struct constructor
	// structs it is. should figure out how i want to store them, and what to store in them
	// i know i want to store a description eventually, for the weapon select menu
	// ok its all set up to be an array, but the descriptions are gonna be ass
	// aeughehrierhierhiegh i need to make weapon and weapon_chunk global not to mention call it
	// its less difficult and more difficult than i expected. mostly just hiccups tho
	
	for(var p = 0; p < WEAPONS.length; p++){
		G.weapon[p] = new Weapon(); 
		G.weapon[p].name = "weapon " + string(p);
	}
	
	G.weapon_chunk[pl_char.x] = [WEAPONS.storm_tornado, WEAPONS.homing_torpedo];
	G.weapon_chunk[pl_char.zero] = [0,0];
	G.weapon_chunk[pl_char.axl] = [0,0];
	G.weapon_chunk[pl_char.vile] = [0,0];
	G.weapon_chunk[pl_char.iris] = [0,0];
	G.weapon_chunk[pl_char.vent] = [0,0];
	G.weapon_chunk[pl_char.megaman] = [WEAPONS.rolling_cutter, WEAPONS.yamato_spear];
	
	// Palettes
	G.weapon[WEAPONS.storm_tornado].set_palette(6);
	G.weapon[WEAPONS.homing_torpedo].set_palette(9);
	G.weapon[WEAPONS.copy_vision].set_palette(13);
	G.weapon[WEAPONS.lightning_bolt].set_palette(15);
	G.weapon[WEAPONS.snow_drift].set_palette(127);
	// Bar Icons
	G.weapon[WEAPONS.storm_tornado].set_icon(0);
	G.weapon[WEAPONS.homing_torpedo].set_icon(5);
	G.weapon[WEAPONS.messenko].set_icon(1);
	G.weapon[WEAPONS.vile_vulcan].set_icon(2);
	G.weapon[WEAPONS.hyper_charge].set_icon(3);
	G.weapon[WEAPONS.falcon_giga].set_icon(2);
	G.weapon[WEAPONS.x2_giga_crush].set_icon(4);
	G.weapon[WEAPONS.nova_strike].set_icon(2);
	G.weapon[WEAPONS.copy_vision].set_icon(6);
	G.weapon[WEAPONS.dive_missile].set_icon(7);
	G.weapon[WEAPONS.lightning_bolt].set_icon(8);
	G.weapon[WEAPONS.x_buster].set_icon(noone);
	G.weapon[WEAPONS.mega_buster].set_icon(noone);
	G.weapon[WEAPONS.a_pistol].set_icon(noone);
	G.weapon[WEAPONS.z_saber].set_icon(noone);
	// Bar color (Image Index)
	G.weapon[WEAPONS.storm_tornado].set_color(1);
	G.weapon[WEAPONS.homing_torpedo].set_color(3);
	G.weapon[WEAPONS.dive_missile].set_color(5);
	G.weapon[WEAPONS.lightning_bolt].set_color(6);
	G.weapon[WEAPONS.copy_vision].set_color(4);
	G.weapon[WEAPONS.messenko].set_color(2);
	G.weapon[WEAPONS.vile_vulcan].set_color(1);
	// Sprite Names
	G.weapon[WEAPONS.a_pistol].set_sprite_name("pistol");
	G.weapon[WEAPONS.a_ray_gun].set_sprite_name("ray");
	// Shots Limit
	G.weapon[WEAPONS.x_buster].set_shot_limit(3);
	G.weapon[WEAPONS.z_buster].set_shot_limit(3);
	G.weapon[WEAPONS.a_pistol].set_shot_limit(200);
	G.weapon[WEAPONS.a_ray_gun].set_shot_limit(200);
	G.weapon[WEAPONS.vile_vulcan].set_shot_limit(10);
	G.weapon[WEAPONS.hyper_charge].set_shot_limit(2);
	G.weapon[WEAPONS.homing_torpedo].set_shot_limit(2);
	G.weapon[WEAPONS.storm_tornado].set_shot_limit(1);
	G.weapon[WEAPONS.mega_buster].set_shot_limit(3);
	G.weapon[WEAPONS.copy_vision].set_shot_limit(4);
	G.weapon[WEAPONS.dive_missile].set_shot_limit(1);
	G.weapon[WEAPONS.lightning_bolt].set_shot_limit(1);
	G.weapon[WEAPONS.fire_storm].set_shot_limit(2);
	G.weapon[WEAPONS.bubble_lead].set_shot_limit(2);
	G.weapon[WEAPONS.atomic_fire].set_shot_limit(2);
	G.weapon[WEAPONS.ice_slasher].set_shot_limit(3);
	G.weapon[WEAPONS.crash_bomb].set_shot_limit(3);
	G.weapon[WEAPONS.metal_blade].set_shot_limit(69);//this one was to be funny
	G.weapon[WEAPONS.quick_boomerang].set_shot_limit(69);//this one was because im lazy
	// Show
	G.weapon[WEAPONS.x_buster].set_show(false);
	G.weapon[WEAPONS.z_buster].set_show(false);
	G.weapon[WEAPONS.a_pistol].set_show(false);
	G.weapon[WEAPONS.z_saber].set_show(false);
	G.weapon[WEAPONS.mega_buster].set_show(false);
	G.weapon[WEAPONS.falcon_giga].set_show(false);
	// Cost
	G.weapon[WEAPONS.x_buster].set_costs([0]);
	G.weapon[WEAPONS.z_buster].set_costs([0]);
	G.weapon[WEAPONS.z_buster_x5].set_costs([0]);
	G.weapon[WEAPONS.nightmare_saber].set_costs([0]);
	G.weapon[WEAPONS.a_pistol].set_costs([0]);
	G.weapon[WEAPONS.a_ray_gun].set_costs([0]);
	G.weapon[WEAPONS.mega_buster].set_costs([0]);
	G.weapon[WEAPONS.messenko].set_costs([7]);
	G.weapon[WEAPONS.hyper_charge].set_costs([4]);
	G.weapon[WEAPONS.nova_strike].set_costs([0]);
	G.weapon[WEAPONS.falcon_giga].set_costs([-1]);
	G.weapon[WEAPONS.x2_giga_crush].set_costs([-1]);
	G.weapon[WEAPONS.speed_gear].set_costs([(28/60) / 256]); // Use for 5 seconds
	G.weapon[WEAPONS.power_gear].set_costs([(28/60) / 5]); // Use for 5 seconds
	G.weapon[WEAPONS.lightning_bolt].set_costs([4]);
	G.weapon[WEAPONS.metal_blade].set_costs([1/8]);
	G.weapon[WEAPONS.quick_boomerang].set_costs([1/8]);
	G.weapon[WEAPONS.needle_shot].set_costs([1/8]);
	G.weapon[WEAPONS.snow_drift].set_costs([1/8]);
	// Weapon Limit
	G.weapon[WEAPONS.vile_vulcan].set_shot_limit(16);
	// Max Level
	G.weapon[WEAPONS.x_buster].set_max_level(infinity);
	G.weapon[WEAPONS.z_buster].set_max_level(infinity);
	G.weapon[WEAPONS.mega_buster].set_max_level(infinity);
	G.weapon[WEAPONS.hyper_charge].set_max_level(0);
	// Auto Charge
	G.weapon[WEAPONS.hyper_charge].set_auto_charge(true);
	// Refill by Hit
	G.weapon[WEAPONS.hyper_charge].set_damage_refill(1);
	G.weapon[WEAPONS.falcon_giga].set_damage_refill(4);
	G.weapon[WEAPONS.x2_giga_crush].set_damage_refill(3);
	// Weapon Level ID
	G.weapon[WEAPONS.a_ray_gun].set_level_id(1);
	// Fill Rate
	G.weapon[WEAPONS.vile_vulcan].set_fill_rate(0.1);
	G.weapon[WEAPONS.speed_gear].set_fill_rate((28/60) / 1);//15
	G.weapon[WEAPONS.power_gear].set_fill_rate((28/60) / 15);
	// Full Sound
	G.weapon[WEAPONS.x2_giga_crush].set_full_sound(snd_player_full_weapon);
	G.weapon[WEAPONS.falcon_giga].set_full_sound(snd_player_full_weapon);
	G.weapon[WEAPONS.speed_gear].set_full_sound(noone);
	G.weapon[WEAPONS.power_gear].set_full_sound(noone);
	// Selectable
	G.weapon[WEAPONS.z_saber].set_selectable(false);
	G.weapon[WEAPONS.nova_strike].set_selectable(false);
	G.weapon[WEAPONS.falcon_giga].set_selectable(false);
	G.weapon[WEAPONS.speed_gear].set_selectable(false);
	G.weapon[WEAPONS.power_gear].set_selectable(false);
	// Scripts
	G.weapon[WEAPONS.x_buster].set_code(player_x_buster_x2);
	G.weapon[WEAPONS.z_buster].set_code(player_zero_buster_x1);
	G.weapon[WEAPONS.storm_tornado].set_code(player_x_storm_tornado);
	G.weapon[WEAPONS.homing_torpedo].set_code(player_x_homing_torpedo);
	G.weapon[WEAPONS.a_pistol].set_code(player_axl_pistol);
	G.weapon[WEAPONS.a_ray_gun].set_code(player_axl_pistol);
	G.weapon[WEAPONS.vile_vulcan].set_code(player_vile_vulcan);
	G.weapon[WEAPONS.hyper_charge].set_code(player_x_hyper_charge);
	G.weapon[WEAPONS.z_buster_x5].set_code(player_zero_buster_x5);
	G.weapon[WEAPONS.nightmare_saber].set_code(player_zero_nightmare_saber);
	//megaman
	G.weapon[WEAPONS.mega_buster].set_code(player_megaman_buster);
	G.weapon[WEAPONS.copy_vision].set_code(player_megaman_copy_vision);
	G.weapon[WEAPONS.lightning_bolt].set_code(player_megaman_lightning_bolt);
	G.weapon[WEAPONS.snow_drift].set_code(player_megaman_arctic_coverage);//i changed the name
	
	mm1_mm6_weapons();
}

function mm1_mm6_weapons(){
	G.weapon[WEAPONS.lightning_bolt].set_palette(15);
	G.weapon[WEAPONS.rolling_cutter].set_palette(16);
	G.weapon[WEAPONS.super_arm].set_palette(17);
	G.weapon[WEAPONS.ice_slasher].set_palette(18);
	G.weapon[WEAPONS.hyper_bomb].set_palette(19);
	G.weapon[WEAPONS.fire_storm].set_palette(20);
	G.weapon[WEAPONS.thunder_beam].set_palette(21);
	G.weapon[WEAPONS.time_slow].set_palette(22);
	G.weapon[WEAPONS.oil_slider].set_palette(23);
	//mm2
	G.weapon[WEAPONS.metal_blade].set_palette(24);
	G.weapon[WEAPONS.time_stopper].set_palette(25);
	G.weapon[WEAPONS.bubble_lead].set_palette(26);
	G.weapon[WEAPONS.air_shooter].set_palette(27);
	G.weapon[WEAPONS.quick_boomerang].set_palette(28);
	G.weapon[WEAPONS.crash_bomb].set_palette(29);
	G.weapon[WEAPONS.atomic_fire].set_palette(30);
	G.weapon[WEAPONS.leaf_shield].set_palette(31);
	G.weapon[WEAPONS.item_1].set_palette(32);
	//mm3
	G.weapon[WEAPONS.needle_shot].set_palette(33);
	G.weapon[WEAPONS.gemini_laser].set_palette(34);
	G.weapon[WEAPONS.hard_knuckle].set_palette(35);
	G.weapon[WEAPONS.magnet_missile].set_palette(36);
	G.weapon[WEAPONS.shadow_blade].set_palette(37);
	G.weapon[WEAPONS.spark_shot].set_palette(38);
	G.weapon[WEAPONS.search_snake].set_palette(39);
	G.weapon[WEAPONS.top_spin].set_palette(40);
	//mm4
	G.weapon[WEAPONS.flash_stopper].set_palette(41);
	G.weapon[WEAPONS.rain_flush].set_palette(42);
	G.weapon[WEAPONS.dive_missile].set_palette(43);
	G.weapon[WEAPONS.skull_barrier].set_palette(44);
	G.weapon[WEAPONS.ring_boomerang].set_palette(45);
	G.weapon[WEAPONS.pharoah_shot].set_palette(46);
	G.weapon[WEAPONS.drill_bomb].set_palette(47);
	G.weapon[WEAPONS.dust_crusher].set_palette(48);
	//mm5
	G.weapon[WEAPONS.power_stone].set_palette(49);
	G.weapon[WEAPONS.star_crash].set_palette(50);
	G.weapon[WEAPONS.napalm_bomb].set_palette(51);
	G.weapon[WEAPONS.water_wave].set_palette(52);
	G.weapon[WEAPONS.charge_kick].set_palette(53);
	G.weapon[WEAPONS.gyro_attack].set_palette(54);
	G.weapon[WEAPONS.gravity_hold].set_palette(55);
	G.weapon[WEAPONS.crystal_eye].set_palette(56);
	//mm6
	G.weapon[WEAPONS.plant_barrier].set_palette(57);
	G.weapon[WEAPONS.centaur_flash].set_palette(58);
	G.weapon[WEAPONS.yamato_spear].set_palette(59);
	G.weapon[WEAPONS.wind_storm].set_palette(60);
	G.weapon[WEAPONS.silver_tomahawk].set_palette(61);
	G.weapon[WEAPONS.knight_crusher].set_palette(62);
	G.weapon[WEAPONS.flame_blast].set_palette(63);
	G.weapon[WEAPONS.blizzard_attack].set_palette(64);
	//mm1
	G.weapon[WEAPONS.rolling_cutter].set_code(player_megaman_rolling_cutter);
	G.weapon[WEAPONS.fire_storm].set_code(player_megaman_fire_storm);
	G.weapon[WEAPONS.super_arm].set_code(player_megaman_super_arm);
	G.weapon[WEAPONS.ice_slasher].set_code(player_megaman_ice_slasher);
	G.weapon[WEAPONS.thunder_beam].set_code(player_megaman_thunder_beam);
	G.weapon[WEAPONS.hyper_bomb].set_code(player_megaman_hyper_bomb);
	G.weapon[WEAPONS.oil_slider].set_code(player_megaman_oil_slider);
	G.weapon[WEAPONS.time_slow].set_code(player_megaman_time_slow);
	G.weapon[WEAPONS.magnet_beam].set_code(player_megaman_magnet_beam);
	//mm2
	G.weapon[WEAPONS.metal_blade].set_code(player_megaman_metal_blade);
	G.weapon[WEAPONS.atomic_fire].set_code(player_megaman_atomic_fire);
	G.weapon[WEAPONS.leaf_shield].set_code(player_megaman_leaf_shield);
	G.weapon[WEAPONS.quick_boomerang].set_code(player_megaman_quick_boomerang);
	G.weapon[WEAPONS.crash_bomb].set_code(player_megaman_crash_bomb);
	G.weapon[WEAPONS.bubble_lead].set_code(player_megaman_bubble_lead);
	G.weapon[WEAPONS.time_stopper].set_code(player_megaman_time_stopper);
	G.weapon[WEAPONS.air_shooter].set_code(player_megaman_air_shooter);
	//mm3
	G.weapon[WEAPONS.shadow_blade].set_code(player_megaman_shadow_blade);
	G.weapon[WEAPONS.top_spin].set_code(player_megaman_top_spin);
	G.weapon[WEAPONS.gemini_laser].set_code(player_megaman_gemini_laser);
	G.weapon[WEAPONS.hard_knuckle].set_code(player_megaman_hard_knuckle);
	G.weapon[WEAPONS.spark_shot].set_code(player_megaman_spark_shot);
	G.weapon[WEAPONS.search_snake].set_code(player_megaman_search_snake);
	G.weapon[WEAPONS.needle_shot].set_code(player_megaman_needle_cannon);
	G.weapon[WEAPONS.magnet_missile].set_code(player_megaman_magnet_missile);
	//mm4
	G.weapon[WEAPONS.dive_missile].set_code(player_megaman_dive_missile);
	G.weapon[WEAPONS.ring_boomerang].set_code(player_megaman_ring_boomerang);
	G.weapon[WEAPONS.drill_bomb].set_code(player_megaman_drill_bomb);
	G.weapon[WEAPONS.rain_flush].set_code(player_megaman_rain_flush);
	G.weapon[WEAPONS.flash_stopper].set_code(player_megaman_flash_stopper);
	G.weapon[WEAPONS.dust_crusher].set_code(player_megaman_dust_crusher);
	G.weapon[WEAPONS.pharoah_shot].set_code(player_megaman_pharoah_shot);
	G.weapon[WEAPONS.skull_barrier].set_code(player_megaman_skull_barrier);
	//mm5
	G.weapon[WEAPONS.power_stone].set_code(player_megaman_power_stone);
	G.weapon[WEAPONS.water_wave].set_code(player_megaman_water_wave);
	G.weapon[WEAPONS.star_crash].set_code(player_megaman_star_crash);
	G.weapon[WEAPONS.gyro_attack].set_code(player_megaman_gyro_attack);
	G.weapon[WEAPONS.charge_kick].set_code(player_megaman_charge_kick);
	G.weapon[WEAPONS.crystal_eye].set_code(player_megaman_crystal_eye);
	G.weapon[WEAPONS.napalm_bomb].set_code(player_megaman_napalm_bomb);
	G.weapon[WEAPONS.gravity_hold].set_code(player_megaman_gravity_hold);
	//mm6
	G.weapon[WEAPONS.yamato_spear].set_code(player_megaman_dive_missile);
	G.weapon[WEAPONS.blizzard_attack].set_code(player_megaman_ring_boomerang);
	G.weapon[WEAPONS.plant_barrier].set_code(player_megaman_drill_bomb);
	G.weapon[WEAPONS.wind_storm].set_code(player_megaman_rain_flush);
	G.weapon[WEAPONS.flame_blast].set_code(player_megaman_flash_stopper);
	G.weapon[WEAPONS.knight_crusher].set_code(player_megaman_dust_crusher);
	G.weapon[WEAPONS.silver_tomahawk].set_code(player_megaman_pharoah_shot);
	G.weapon[WEAPONS.centaur_flash].set_code(player_megaman_skull_barrier);
	//mm1
	G.weapon[WEAPONS.rolling_cutter].set_name("rolling cutter");
	G.weapon[WEAPONS.fire_storm].set_name("fire storm");
	G.weapon[WEAPONS.super_arm].set_name("super arm");
	G.weapon[WEAPONS.ice_slasher].set_name("ice slasher");
	G.weapon[WEAPONS.thunder_beam].set_name("thunder beam");
	G.weapon[WEAPONS.hyper_bomb].set_name("hyper bomb");
	G.weapon[WEAPONS.oil_slider].set_name("oil slider");
	G.weapon[WEAPONS.time_slow].set_name("time slow");
	G.weapon[WEAPONS.magnet_beam].set_name("magnet beam");
	//mm2
	G.weapon[WEAPONS.metal_blade].set_name("metal blade");
	G.weapon[WEAPONS.atomic_fire].set_name("atomic fire");
	G.weapon[WEAPONS.leaf_shield].set_name("leaf shield");
	G.weapon[WEAPONS.quick_boomerang].set_name("quick boomerang");
	G.weapon[WEAPONS.crash_bomb].set_name("crash bomb");
	G.weapon[WEAPONS.bubble_lead].set_name("bubble lead");
	G.weapon[WEAPONS.time_stopper].set_name("time stopper");
	G.weapon[WEAPONS.air_shooter].set_name("air shooter");
	//mm3
	G.weapon[WEAPONS.shadow_blade].set_name("shadow blade");
	G.weapon[WEAPONS.top_spin].set_name("top spin");
	G.weapon[WEAPONS.gemini_laser].set_name("gemini laser");
	G.weapon[WEAPONS.hard_knuckle].set_name("hard knuckle");
	G.weapon[WEAPONS.spark_shot].set_name("spark shot");
	G.weapon[WEAPONS.search_snake].set_name("search snake");
	G.weapon[WEAPONS.needle_shot].set_name("needle cannon");
	G.weapon[WEAPONS.magnet_missile].set_name("magnet missile");
	//mm4
	G.weapon[WEAPONS.dive_missile].set_name("dive missile");
	G.weapon[WEAPONS.ring_boomerang].set_name("ring boomerang");
	G.weapon[WEAPONS.drill_bomb].set_name("drill bomb");
	G.weapon[WEAPONS.rain_flush].set_name("rain flush");
	G.weapon[WEAPONS.flash_stopper].set_name("flash stopper");
	G.weapon[WEAPONS.dust_crusher].set_name("dust crusher");
	G.weapon[WEAPONS.pharoah_shot].set_name("pharoah shot");
	G.weapon[WEAPONS.skull_barrier].set_name("skull barrier");
	//mm5
	G.weapon[WEAPONS.power_stone].set_name("power stone");
	G.weapon[WEAPONS.water_wave].set_name("water wave");
	G.weapon[WEAPONS.star_crash].set_name("star crash");
	G.weapon[WEAPONS.gyro_attack].set_name("gyro attack");
	G.weapon[WEAPONS.charge_kick].set_name("charge kick");
	G.weapon[WEAPONS.crystal_eye].set_name("crystal eye");
	G.weapon[WEAPONS.napalm_bomb].set_name("napalm bomb");
	G.weapon[WEAPONS.gravity_hold].set_name("gravity hold");
	//mm6
	G.weapon[WEAPONS.centaur_flash].set_name("centaur flash");
	G.weapon[WEAPONS.knight_crusher].set_name("knight crusher");
	G.weapon[WEAPONS.blizzard_attack].set_name("blizzard attack");
	G.weapon[WEAPONS.yamato_spear].set_name("yamato spear");
	G.weapon[WEAPONS.plant_barrier].set_name("plant barrier");
	G.weapon[WEAPONS.flame_blast].set_name("flame blast");
	G.weapon[WEAPONS.silver_tomahawk].set_name("silver tomahawk");
	G.weapon[WEAPONS.wind_storm].set_name("wind storm");
}
