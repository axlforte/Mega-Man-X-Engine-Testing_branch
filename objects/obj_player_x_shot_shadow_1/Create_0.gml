event_inherited();
sound = snd_player_x_shot_1;
destroy_if_hit = true;

atk = 2;
//abs_hspeed = 4;
abs_speed = 4;
dir_angle = 0;

animations_init();

animation_add("loop",
[
	0, 0,
	4, 1,
	8, 2,
	11, 2
], 0, 11);

animation_play("loop");
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;