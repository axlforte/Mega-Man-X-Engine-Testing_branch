event_inherited();

destroy_if_hit = true;
atk = 2;
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
	0, 0,
	5, 1,
	10, 2,
	15, 3,
	20, 2,
	25, 1,
	30, 0
], 0, 30);

animation_play("B");
sound = snd_megaman_shot_1;
abs_hspeed = 4;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;