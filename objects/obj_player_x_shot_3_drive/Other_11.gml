/// @description Step
event_inherited();
var t = timer++;

if (destroy)
{
	h_speed = 0;
}
else
{
	abs_hspeed += 0.5;
	abs_hspeed = min(abs_hspeed, 6.5);

	h_speed = abs_hspeed * dir;
}