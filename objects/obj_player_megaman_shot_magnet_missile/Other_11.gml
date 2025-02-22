/// @description Step
event_inherited();

var t = timer++;
if (t == 0) {
	var inst = instance_create_depth(x, y, depth, obj_player_megaman_shot_2_effect);
	inst.image_xscale = dir;
	inst.owner = owner;
		if (instance_exists(owner)) {
			inst.owner_x = owner.x;
			inst.owner_y = owner.y;
		}
	inst.shot_counted = false;
}
with(par_enemy){
	if(!other.nyooming){
		if(abs(x - other.x) < 16){
			other.h_speed = 0;
			other.v_speed = sign(y - other.y) * 4;
			other.image_angle = -90 * sign(other.v_speed);
			other.nyooming = true;
		}
	}
}
if(!nyooming){
	x += 4 * dir;
}
if (t == 2)
{
	animation_play("L");	
}