event_inherited();
anti_destroy = true;
anti_destroy_limit = 3;

destroy_if_hit = true;
rot = 0;
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

animation_add("stagnant",[
	0, 1,
	3, 2, 
	6, 3,
	9, 4, 
	12, 4
], 12);

animation_add("slide", [0, 6], 0)

animation_play("B");
sound = snd_megaman_shot_1;
abs_hspeed = 4;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;

jump_strength = instance_nearest(x,y, obj_player_parent).jump_strength;
dash_speed = instance_nearest(x,y, obj_player_parent).dash_speed;

status = oil.falling;
colliding_w_player = false;
grav = 0.2;
h_speed = 0;
gravity_water = -0.1;
scr_keys_reset();