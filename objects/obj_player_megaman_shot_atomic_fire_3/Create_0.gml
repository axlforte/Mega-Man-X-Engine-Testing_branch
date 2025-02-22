event_inherited();

destroy_if_hit = true;
atk = 3;
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
	0, 2,
	5, 3,
	10, 4,
	15, 5,
	20, 4,
	25, 3,
	30, 2
], 0, 30);

animation_play("B");
sound = snd_megaman_shot_1;
abs_hspeed = 4;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;