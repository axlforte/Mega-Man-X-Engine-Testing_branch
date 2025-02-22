event_inherited();
atk = 4;
//y += 4;
destroy_if_equal_to_atk = false;
abs_speed_max = 3;
abs_speed = 3;
acceleration = 0;
target = noone;
h_accel = 0;
v_accel = 0;
dir_angle = 0;

sound = missileshot;
animation_add("spin",
[
	0,1,
	1,2,
	2,3,
	3,4,
	4,5,
	5,6,
	6,7,
	7,8,
	8,9,
	9,10,
	10,11,
	11,12,
	12,13,
	13,13
]);
is_main = true;
shot_type = 1;
homing_limit_min = 15;
homing_limit_max = 35565;

animation_play("spin");