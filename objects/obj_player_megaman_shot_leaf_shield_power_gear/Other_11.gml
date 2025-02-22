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
	
	if(t mod 20 <= 4){
		x -= 2;
		y+=2;
		animation_fr = 9;
	} else if(t mod 20 <= 9){
		x -= 3;
		y++;
		animation_fr = 8;
	} else if(t mod 20 <= 14){
		x += 2;
		y+=2;
		animation_fr = 9;
	} else {
		x += 3;
		y++;
		animation_fr = 10;
	}
}
