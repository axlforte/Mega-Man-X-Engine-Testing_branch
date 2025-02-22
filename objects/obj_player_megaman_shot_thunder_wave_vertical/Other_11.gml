/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;

	if (t >= 2) {
		animation_play("L");	
	}
}