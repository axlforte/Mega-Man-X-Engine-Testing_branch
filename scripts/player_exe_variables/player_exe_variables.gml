function player_exe_variables() {
	// Intro

	// Weapon Test
	player_weapon_set(0, WEAPONS.hub_buster);
	player_weapon_select(WEAPONS.hub_buster);

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
	intro_end_animation = "";
}
