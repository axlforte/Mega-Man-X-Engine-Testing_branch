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
h_speed = 0;
atk = 3;
shot_level = 1;
hit_if_shot_level_is_equal = true;
boss_damage[? noone] = 2; // Default damage on bosses
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;
has_hit = false;
death_timer = -32;
lim = global.view_width * 16;
destroy_when_off_screen = false;