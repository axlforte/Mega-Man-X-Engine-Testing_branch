event_inherited();

with(obj_player_parent){
	if(!key_shoot){
		instance_destroy(other);
	}
	other.dir = dir;
	shoot_t--;
}

player_shot_pos_fix(true);

if(flame_interval < flame_t){
	player_shot_pos_fix(true);
	flame_t = 0;
	var p = instance_create_depth(x,y,depth, flame);
	p.dir = dir;
	p.image_xscale = dir;
	p.h_speed = flame_speed * dir;
	p.v_speed = flame_vspeed;
	p.grav = flame_gravity;
	p.owner = owner;
	with(owner){
		weapon_energy[current_weapon] -= player_weapon_get_cost(current_weapon, 0);
	}
} else {
	flame_t++;
}

if(owner.weapon_energy[owner.current_weapon] <= 0 || owner.state == states.dolor){
	instance_destroy();
}