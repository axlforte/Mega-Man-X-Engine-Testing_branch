function player_check_weapon_change() {
	if (state == states.death || !weapon_can_change) exit;

	var old_id = weapon_id;
	var change_dir = key_p_wp1 - key_p_wp2;
	
	if(instance_exists(obj_player_megaman_shot_time_stopper))
		return;
		
	if (change_dir != 0) {
		do {
			weapon_id = (weapon_id + change_dir + WEAPONS.length) mod WEAPONS.length;
			log(weapon_id)
			log(weapon_slot_handler.get_enabled(weapon_id))
			log(weapon_list[weapon_id])
		}
		until (weapon_slot_handler.get_weapon(weapon_id) != noone && weapon_slot_handler.get_enabled(weapon_id));
	}
	var wp = weapon_slot_handler.get_weapon(weapon_id);
	if (old_id != weapon_id) {
		player_weapon_select(wp);
		charge_image_number = 22;
		charge_sprite_min_level = 1;	
		if (auto_charge != global.weapon[wp].auto_charge) {
			auto_charge = global.weapon[wp].auto_charge;
			charge_level = 0;
			charge = false;
			shot_id = 0;
			audio_stop(charge_sound);
			if (auto_charge) {
				charge_sprite_min_level = 0;
				charge_image_number = sprite_get_number(auto_charge_sprite);
			}
		}
	}
	player_weapon_refill(false);


}
