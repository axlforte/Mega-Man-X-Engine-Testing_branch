/// @description Step
event_inherited();

if(death_timer >= 0){
	death_timer--;
} else if(death_timer >= -4 && death_timer <= 0){
	instance_destroy();
}
if (timer == 0) {
	while(lim > 0 && can_hit){
		scr_weapon_collision();
		if(!move_x(dir) || destroy){
			can_hit = false;
			h_speed = 0;
			abs_hspeed = 0;
		}
		lim--;
	}
	can_hit = false;
	timer++;
	death_timer = (global.view_width - lim) / 4 + 15;
	if(lim == 0)
		death_timer = 5;
	//death_timer = ceil(death_timer);
}