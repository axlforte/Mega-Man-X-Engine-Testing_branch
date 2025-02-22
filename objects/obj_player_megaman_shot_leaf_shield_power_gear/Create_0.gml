event_inherited();

destroy_if_hit = true;
atk = 5;
// Destroy Animation
animation_add("D",
[
	0, 1,
	2, 2,
	4, 3,
	5, 3
]);

// Blocked Animation
animation_add("B",
[
	0, 8,
	1,9,
	2,8,
	3,7
], 0, 4);

animation_play("B");
sound = snd_megaman_shot_1;
abs_hspeed = 0;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;
animation_fr = 8;