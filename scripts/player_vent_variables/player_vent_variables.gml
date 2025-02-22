function player_vent_variables() {
	// Intro
	intro_animation = "intro2"; // Unarmored part
	intro_end_animation = "intro2_end"; // Armored part

	//weapons are defined in biometal model x because the other biometals can have other weapons
	//god fx can program his shots god fuckin damn
	
	weapon_allow_pallete = false;
	charge_palette_enabled = false;

	// Charge
	charge_unlocked = true;
	
	state_unlocked[states.biometal_select] = true;
	state_enabled[states.biometal_select] = true;
	saber_atk_unlocked[saber_atks.dass] = true;
	saber_air_change_animation = false;

	// Mobile buttons
	mobile_buttons_set_sprite(spr_x_mobile_buttons);
	mobile_weapon_swap_set_sprites(spr_mobile_weapon1, spr_mobile_weapon2);
	glow_circle_subtract = [
		{alpha: 0.2, radius: 42 },
		{alpha: 1, radius: 30 }
	];
	trail_color = c_blue;
	wall_slide_vspeed = 1.75;
}
