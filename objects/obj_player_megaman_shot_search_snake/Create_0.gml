event_inherited();

destroy_if_hit = true;
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
	0, 0
], 0, 0);

animation_play("B");
sound = snd_megaman_shot_1;
abs_hspeed = 0;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;
v_speed = 0;
h_speed = 0;
grav = 0.25;

facing = noone;//wall is going up wall, roof is down wall. you die if you hit a cieling