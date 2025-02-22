/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	if (t == 0) {
		audio_play(sound);
		var inst = instance_create_depth(x, y, depth, obj_player_megaman_shot_3_effect);
		inst.image_xscale = dir;
		inst.owner = owner;
		if (instance_exists(owner)) {
			inst.owner_x = owner.x;
			inst.owner_y = owner.y;
		}
		inst.shot_counted = false;
	}
	if (t < player_lock){ 
		//player_shot_pos_fix();
		owner.y = initial_player_y;
		owner.x = initial_player_x;
		owner.v_speed = 0;
		owner.h_speed = 0;
	}else if (t == player_lock) abs_hspeed = 2;
	else if (t >= player_lock && t <= player_lock * 1.25) abs_hspeed = 3;
	else if (t >= player_lock * 1.25 && t <= player_lock * 1.5) abs_hspeed = 4;
	else if (t >= player_lock * 1.5 && t <= player_lock * 1.75) abs_hspeed = 5;
	else if (t >= player_lock * 1.75) abs_hspeed = 6;
	
	abs_hspeed = min(abs_hspeed, abs_hspeed_max);
	h_speed = abs_hspeed * dir;
}