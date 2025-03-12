function player_state_drive_saber() {
	var t = state_timer++;
	var _air = "";

	player_effects_reset();
	shoot_wait = true;
	// Jump
	var can_jump = player_can_jump();
	if (key_p_jump && can_jump)
	{
		v_speed = -jump_strength;
		_air = "_air";
		if (can_jump == 2) dash_air_count++;
	}
	if (!key_jump && v_speed < 0)
		v_speed = 0;
	// Air
	if (!is_on_floor() || v_speed > 0) {
		_air = "_air";
		player_check_move();
	}
	animation = "";
	animation_play("saber" + _air, t + 4);
	// End
	if (t > shoot_limit)
	{
		player_state_set(states.idle);
		animation_play("idle");
		if (!is_on_floor())
		{
			if (v_speed < 0)
			{// unless 
				player_state_set(states.jump, 7);
				animation_play("jump", 7);
			}
			else
			{
				player_state_set(states.fall, 8)
				animation_play("fall", 8);
			}
		}
	}

	if (charge_level == 0) {
		player_charge_reset();	
	}
	
	if (state != states.x3_saber)
	{
		shoot = false;
		shoot_wait = false;
	}

	if (t == 2)
	{
		player_shoot_projectile(obj_player_x_shot_saber_drive, shot_id);
		shot_id = 0;
	}

}
