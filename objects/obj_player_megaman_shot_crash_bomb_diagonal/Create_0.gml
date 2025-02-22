event_inherited();

destroy_if_hit = true;
can_hit = false;
atk = 5;
anti_destroy = true;
anti_destroy_limit = 3;

animation_add("B",
[
	0, 0
], 0, 0);

//latch
animation_add("L",
[
	0, 1,
	2, 2
], 2);

//before exploding
animation_add("E",
[
	0, 3,
	2, 2,
	4, 3
],0, 4);

animation_play("B");
sound = snd_megaman_shot_1;
if(instance_number(obj_player_megaman_shot_crash_bomb_diagonal) == 2){
	abs_hspeed = 4;
	v_speed = 2;
} else if(instance_number(obj_player_megaman_shot_crash_bomb_diagonal) == 1){
	abs_hspeed = 3;
	v_speed = 3;
} else {
	abs_hspeed = 2;
	v_speed = 4;
}
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;
boom_timer = 30;
lit = false;