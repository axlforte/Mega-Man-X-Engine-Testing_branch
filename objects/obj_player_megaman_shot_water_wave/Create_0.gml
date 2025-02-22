event_inherited();
sound = snd_megaman_shot_2;

abs_hspeed = 1;
atk = 2;

// Start
animation_add("S",
[
	0, 0,
	5, 1,
	10, 2, 
	15, 3
], 5, 20);

animation_play("S");

grav = 0.2;
v_speed = 0;

execute_step_in_first_frame = true;