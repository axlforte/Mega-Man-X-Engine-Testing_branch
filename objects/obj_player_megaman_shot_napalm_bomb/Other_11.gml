/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
		var t = timer++;
	
	if(is_on_floor() && ground_bounces > 0){
		ground_bounces--;
		v_speed = abs(h_speed) * -1;
		h_speed = h_speed * 0.5;
		y-=4;
		audio_play(snd_player_land);
	}
	
	if(!can_move_x(h_speed * dir)){
		h_speed = h_speed * -0.6;
	}
	
	if(ground_bounces <= 0){
		move_down(1);
		v_speed = 0;
		if(boom_index % 4 != 0){
			boom_index++;
		}
		grav = 0;
		h_speed = 0;
		boom_index = 0;
		if(t > fuse_timer){
			instance_destroy();
			sprite_index = spr_hyper_bomb_explosion;
			boom_index = (t - fuse_timer) / 4;
			mask_index = spr_hyper_bomb_explosion;
			if(t > fuse_timer + 16){
				audio_play(snd_X1_explode);
			}
			can_hit = true;
		} else {
			can_hit = false
		}
	} else {
	
		boom_index += h_speed / 4;
	}
}