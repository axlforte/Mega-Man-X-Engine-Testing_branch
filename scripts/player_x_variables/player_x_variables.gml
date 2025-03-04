function player_x_variables() {
	// Intro
	intro_animation = "intro2"; // Unarmored part
	intro_end_animation = "intro2_end"; // Armored part

	// Weapon Test
	weapon_slot_handler.add_weapon(WEAPONS.storm_tornado);
	weapon_slot_handler.add_weapon(WEAPONS.homing_torpedo);
	
	weapon_slot_handler.add_weapon(WEAPONS.thunder_beam);
	weapon_slot_handler.add_weapon(WEAPONS.fire_storm);
	
	weapon_slot_handler.add_weapon(WEAPONS.air_shooter);
	weapon_slot_handler.add_weapon(WEAPONS.bubble_lead);
	
	weapon_slot_handler.add_weapon(WEAPONS.hard_knuckle);
	weapon_slot_handler.add_weapon(WEAPONS.gemini_laser);
	
	weapon_slot_handler.add_weapon(WEAPONS.spark_shot);
	weapon_slot_handler.add_weapon(WEAPONS.atomic_fire);

	// Charge
	charge_unlocked = true;

	// Mobile buttons
	mobile_buttons_set_sprite(spr_x_mobile_buttons);
	mobile_weapon_swap_set_sprites(spr_mobile_weapon1, spr_mobile_weapon2);
	glow_circle_subtract = [
		{alpha: 0.2, radius: 42 },
		{alpha: 1, radius: 30 }
	];
	trail_color = c_blue;
}
