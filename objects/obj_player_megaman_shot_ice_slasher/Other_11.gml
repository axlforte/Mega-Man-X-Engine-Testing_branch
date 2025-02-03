/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	if (t == 0) {
		var inst = instance_create_depth(x, y, depth, obj_player_megaman_shot_2_effect);
		inst.image_xscale = dir;
		inst.owner = owner;
		inst.owner_x = owner.x;
		inst.owner_y = owner.y;
		inst.shot_counted = false;
	}

	if (t == 2)
	{
		animation_play("L");	
	}
	
	if(t mod 2 == 0){
		if(irandom_range(0, 5) < 3){
			instance_create_depth(x + irandom_range(-8,8), y + irandom_range(-8,8), depth + 1, obj_player_megaman_shot_ice_slasher_particles);
		} else {
			instance_create_depth(x + irandom_range(-8,8), y + irandom_range(-8,8), depth + 1, obj_player_megaman_shot_ice_slasher_particles_2);
		}
	}
}