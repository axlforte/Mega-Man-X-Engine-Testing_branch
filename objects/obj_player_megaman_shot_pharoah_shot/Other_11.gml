/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	scr_keys_update();
	if(key_shoot && !released){
		timer++;
		goal_x = global.player_x;
		goal_y = global.player_y - 20;
		var _dstx = x - goal_x;
		if(_dstx > 40){
			x -= 5;
		} else if(_dstx > 20){
			x -= 2;
		} else if(_dstx > 10){
			x -= 1;
		} else if(_dstx < -40){
			x += 5;
		} else if(_dstx < -20){
			x += 2;
		} else if(_dstx < -10){
			x += 1;
		}
		
		var _dsty = y - goal_y;
		if(_dsty > 40){
			y -= 5;
		} else if(_dsty > 20){
			y -= 2;
		} else if(_dsty > 10){
			y -= 1;
		} else if(_dsty < -10){
			y += 1;
		} else if(_dsty < -20){
			y += 2;
		} else if(_dsty < -40){
			y += 5;
		}
		
		with(obj_player_parent){
			other.dir = dir;
		}
	} else {
		released = true;
		if(timer > 45){
			x += 5 * dir;
		} else {
			atk = 2;
			x += 2 * dir;
		}
	}
}