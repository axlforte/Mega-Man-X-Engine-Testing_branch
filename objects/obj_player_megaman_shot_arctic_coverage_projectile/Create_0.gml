event_inherited();

destroy_if_hit = true;
animation_add("B", [
0,0,
2,1,
4,2,
6,3,
9,4,
13,5,
20,6,
24,7,
26,8,
27,8
]);
animation_play("B");
sound = snd_megaman_shot_1;
abs_hspeed = 6;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;