/// @description Step
event_inherited();

if(destroy){
	animation_i++;
}

if (animation_end)
{
	instance_destroy();
}
else
{
	var t = timer++;
	h_speed = abs_hspeed * dir;
	abs_hspeed = abs_hspeed * 0.9;
	y += v_speed;
}
