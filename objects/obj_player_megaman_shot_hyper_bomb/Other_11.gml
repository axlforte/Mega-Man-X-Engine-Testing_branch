/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
		var t = timer++;
	
	if(is_on_floor() && ground_bounces > 0){
		ground_bounces--;
		v_speed = -2;
		h_speed = h_speed * 0.75;
		y-=4;
		boom_index = 1;
		audio_play(snd_player_land);
	}
	
	if(!can_move_x(h_speed * dir)){
		h_speed = h_speed * -0.8;
	}
	
	if((abs(v_speed) < 1.5 && ground_bounces < 3) && abs(v_speed) > 0.5){
		boom_index = 2;
	}
	
	if(ground_bounces <= 0){
		move_down(1);
		v_speed = 0;
		grav = 0;
		h_speed = 0;
		boom_index = 0;
		if(t > fuse_timer / 2 && t mod 4 <= 1){
			boom_index += 3;
		}
		if(t > fuse_timer){
			sprite_index = spr_hyper_bomb_explosion;
			boom_index = (t - fuse_timer) / 4;
			mask_index = spr_hyper_bomb_explosion;
			if(t > fuse_timer + 16){
				audio_play(snd_X1_explode);
				instance_destroy();
			}
			can_hit = true;
		} else {
			can_hit = false
		}
	} 
}