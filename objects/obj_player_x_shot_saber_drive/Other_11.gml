/// @description Step
event_inherited();
var t = timer++;

if (t == 50)
{
	destroy = true;
}

if owner.state != states.drive_saber || owner.state_timer == 0{instance_destroy();}