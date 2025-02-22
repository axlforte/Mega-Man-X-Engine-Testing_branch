/// @description Step
event_inherited();

if (dash) {
/*	if (global.dash_lemon_visible)
		sprite_index = spr_x_shot_11;
	else sprite_index = spr_megaman_shot_1;*/
	if (ds_exists(boss_damage, ds_type_map))
		boss_damage[? noone] = 2;
	atk = 2;
}

if (destroy)
{
	var t = destroy_t - 1;
	if (blocked_reflect && blocked && (t <= 1))
	{
		x = xprevious;
		y = yprevious;
		h_speed = -6 * dir;
		v_speed = -3;
		if (dash)
		{
			grav = 0.25;
		}
	}
}
else
{
	var t = timer++;
	
	if(t < 5){
		y -= 2;
		x += dir * 5;
	} else if(t < 10){
		y += 2;
		x += dir * 5;
	} else if(t < 15){
		y += 2;
		x -= dir * 5;
	} else if(t < 20){
		y -= 2;
		x -= dir * 5;
	} else {
		instance_destroy();
	}
}
