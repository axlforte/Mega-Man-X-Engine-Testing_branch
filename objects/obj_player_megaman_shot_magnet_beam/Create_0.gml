event_inherited();

can_hit = false;
// Destroy Animation
animation_add("D",
[
	0, 1,
	2, 2,
	4, 3,
	5, 3
]);

fuckin_id_id = 0;
d_time = 5*60;

// Blocked Animation
animation_add("B",
[
	0, 0
], 0, 0);

animation_play("B");
sound = snd_megaman_shot_1;
abs_hspeed = 4;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;
beam_tip_offset = 0;
anim_offset = 0;
anim_frame = 0;

coll = instance_create_depth(x,y,depth, obj_square_16);
coll.image_xscale = 4/16;
coll.image_yscale = 6/16;