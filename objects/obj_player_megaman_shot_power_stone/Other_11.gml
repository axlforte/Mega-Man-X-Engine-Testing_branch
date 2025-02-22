/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	if (t == 0 && is_orig) {
		var inst = instance_create_depth(x, y, depth, obj_player_megaman_shot_2_effect);
		inst.image_xscale = dir;
		inst.owner = owner;
		if (instance_exists(owner)) {
			inst.owner_x = owner.x;
			inst.owner_y = owner.y;
		}
		inst.shot_counted = false;
		var p = instance_create_depth(x,y,depth,obj_player_megaman_shot_power_stone);
		p.ngle = 120;
		p.is_orig = false;
		p.dir = dir;
		p = instance_create_depth(x,y,depth,obj_player_megaman_shot_power_stone);
		p.ngle = 240;
		p.is_orig = false;
		p.dir = dir;
	}
	
	ngle += ngle_add;
	
	atk = spd / 2;
	
	h_speed = sin(ngle / 180 * pi) * spd;
	v_speed = cos(ngle / 180 * pi) * spd;
	spd += spd_ncrease;
	if (t == 2)
	{
		animation_play("L");	
	}
}