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
	flame_t = 0;
	var p = instance_create_depth(x,y,depth, flame);
	p.dir = dir;
	p.image_xscale = dir;
	p.h_speed = flame_speed * dir;
	p.grav = flame_gravity;
	p.owner = owner;
	owner.weapon_energy[owner.current_weapon] -= player_weapon_get_cost(owner.current_weapon, 0);
} else {
	flame_t++;
}

if(owner.weapon_energy[owner.current_weapon] <= 0){
	instance_destroy();
}