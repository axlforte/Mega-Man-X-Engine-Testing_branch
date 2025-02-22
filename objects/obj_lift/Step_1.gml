switch(state){
	case lift.idle:
		if(instance_exists(obj_player_parent)){
			if(global.is_online == 2){
		
			} else {
				var _p = instance_nearest(x,y,obj_player_parent)
				if(_p.x > x && _p.x < x + 96 &&
				_p.y < y && _p.y > y - 32 &&
				_p.state != states.fall && _p.state != states.jump){
					if(_p.key_p_up)
						{state = lift.up;   index--;}
					if(_p.key_p_down)
						{state = lift.down; index++;}
						index = clamp(index,0,3);
				}
			}
		}
	break;
	case lift.down:
		if(instance_exists(obj_player_parent)){
			if(global.is_online == 2){
		
			} else {
				var _p = instance_nearest(x,y,obj_player_parent)
					y += 2;
				if(_p.x > x && _p.x < x + 96 &&
				_p.y < y && _p.y > y - 32 &&
				_p.state != states.fall && _p.state != states.jump){
					_p.y += 2;
				}
				
				if(y > positions[index] - 2){
					y = positions[index];
					state = lift.idle
				}
			}
		}
	break;
	case lift.up:
		if(instance_exists(obj_player_parent)){
			if(global.is_online == 2){
		
			} else {
				var _p = instance_nearest(x,y,obj_player_parent)
				if(_p.x > x && _p.x < x + 96 &&
				_p.y < y && _p.y > y - 32){
					_p.y -= 2;
					_p.x = clamp(_p.x, x + players_fat_ass + 1, x + 95 - players_fat_ass);
				}
					y -= 2;
				if(y < positions[index] + 2){
					var _old_y = y;
					y = positions[index];
					_p.y -= _old_y - y;
					state = lift.idle
				}
			}
		}
	break;
}

coll.x = x;
coll.y = y + 16;