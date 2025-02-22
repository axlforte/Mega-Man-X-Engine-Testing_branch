event_inherited();
sound = snd_megaman_shot_2;

abs_hspeed = 4;
atk = 2;

// Start
animation_add("S",
[
	0, 0,
	2,1,
	4,2,
	6,3
], 0, 8);

animation_play("S");
scr_keys_reset();
changed_dir = false;
execute_step_in_first_frame = true;