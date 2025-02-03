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
	instance_destroy();
}
else
{
	var t = timer++;
	if(!can_move_x(abs_hspeed*dir) && !lit){
		abs_hspeed = 0;
		h_speed = 0;
		lit = true;
		animation_play("L");
	}
	if(lit){
		boom_timer--;
		if(boom_timer == 15){
			animation_play("E");
		} else if(boom_timer < 0){
			instance_create_depth(x,y,depth - 1,explode_FX);
			instance_destroy();
		} else if(boom_timer < 1){
			can_hit = true;
			mask_index = spr_hyper_bomb_explosion;
		}
	}
}
