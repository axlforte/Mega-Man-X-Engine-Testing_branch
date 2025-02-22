/// @description Step
event_inherited();

enum oil {falling, stagnant, sliding};

if (destroy)
{
	if(status == oil.sliding){
		with(obj_player_parent){
			locked = false;
			rotation = 0;
			player_state_set(states.fall, 0);
		}
	}
	instance_destroy();
}
else
{
	var t = timer++;
	
	switch(status){
		case(oil.falling):
		
			if(instance_place(x,y,obj_water)){
				grav = -0.1;
				dash_speed = dash_speed / 2;
			} else {
				grav = 0.2;
			}
		
			if(can_move_x(dash_speed * dir)){
				move_x((dash_speed * dir) / 2);
			}
			if(is_on_floor() || (!instance_place(x, y - 4, obj_water) && instance_place(x, y + 4, obj_water))){
				grav = 0;
				animation_play("stagnant")
				status = oil.stagnant;
				y -= 8;
				move_down();
			}
		break;
		case(oil.stagnant):
			v_speed = 0;
			h_speed = 0;
			
			if(instance_place(x,y, obj_block_parent)){
				y--;
			}
			
			if(colliding_w_player){
				with(obj_player_parent){
					locked = true;
					//other.dir = dir;
					player_state_set(states.oil_slide, 0);
					other.dash_speed = dash_speed;
					other.depth = depth + 1;
				}
				animation_play("slide");
				//grav = 0.25;
				status = oil.sliding;
				h_speed = 0;
				atk = 8;
			}
		break;
		case(oil.sliding):
			scr_keys_update();
			with(obj_player_parent){
				x = other.x;
				y = other.y - 16;
				v_speed = 0;
			}
			if(can_move_x(dash_speed * dir) && !key_p_dash){
				move_x(dash_speed * dir);
				
				if(is_on_floor(v_speed - grav) || instance_place(x, y + (v_speed - grav), obj_water)){
					grav = 0;
					v_speed = 0;
				} else {
					if(!is_on_floor(8))
						grav = 0.25;
				}
				if(instance_place(x,y - 1, obj_block_parent)){
					y--;
				}
				if(grav == 0){
					rot = 0;
				} else {
					rot = 30 * dir;
				}
				
				if(key_p_jump){
					v_speed = jump_strength * -1;
					grav = 0.25;
					y -= 4;
				}
			} else {
				with(obj_player_parent){
					locked = false;
					rotation = 0;
					player_state_set(states.fall, 0);
				}
				instance_destroy();
			}
		break;
	}
}
colliding_w_player = false;