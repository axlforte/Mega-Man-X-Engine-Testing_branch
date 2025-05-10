event_inherited();
lv = 4;
atk = 8;
boss_damage[? noone] = 3;
shot_level = 2;
hit_if_shot_level_is_equal = true;

sound = snd_player_x_shot_ult;

animations_init();

animation_add("init",
[
	0, 0,
	2, 1,
	4, 2,
	6, 3,
], 0);

animation_add("loop",
[
	0, 0, 
	3, 1,
	6, 2,
	9, 2
], 0);

abs_hspeed = 0;
execute_step_in_first_frame = true;