event_inherited();
anti_destroy = true;
anti_destroy_limit = 64;

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
v_speed = 0;
h_speed = 0;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;

bounce_limit = 5;
dir = 0;
diag = 0;
ignore_coll = 2;
anim_offset = 2;
die_now = false;