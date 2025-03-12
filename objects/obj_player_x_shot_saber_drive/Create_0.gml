event_inherited();
atk = 2;
sound = snd_player_x_shot_x2_super;

animations_init();
animation_add("saber",
[
	0, 0,
	2, 1,
	5, 2,
	6, 3,
	7, 4,
	9, 5,
	11, 6,
	13, 7,
	15, 8,
	17, 9,
	21, 10,
	37, 9,
	40, 2,
	43, 1,
	51, 0
]);

shots = [];
abs_hspeed = 0;

animation_play("saber" , 6);
execute_step_in_first_frame = true;