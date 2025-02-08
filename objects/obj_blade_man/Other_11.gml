enum BLADE_MAN {
	DASH,
	CUT,
	DIVEBOMB,
	BIG_BLADE
}
switch (state) {
	case(BLADE_MAN.DASH):
		if(t == 0){
			grav = 0;
			v_speed = 0;
			h_speed = 0;
			goal_point = jump_points[irandom_range(0, jp_count)];
		}
		
		move_towards_point(goal_point.x, goal_point.y, dash_speed);
		
		if(goal_point.loc == BLADE_LOCATION.FLOOR){
			if(is_on_floor()){
				state_set(BLADE_MAN.CUT);
			}
		} else if(goal_point.loc == BLADE_LOCATION.ROOF){
			if(is_on_ceil()()){
				state_set(BLADE_MAN.CUT);
			}
		} else {
			if(!can_move_x(sign(x - goal_point.x) * dash_speed)){
				state_set(BLADE_MAN.CUT);
			}
		}
	break;
	
	case(BLADE_MAN.CUT):
		if(t == 0){
			hp_start_of_swing = hp;
		}
		if(t == 30){
			switch(goal_point.loc){
				case(BLADE_LOCATION.ROOF):
					var p = instance_create_depth(x,y,depth, obj_blade_man_blade);
					p.dir_angle = 45;
					p = instance_create_depth(x,y,depth, obj_blade_man_blade);
					p.dir_angle = 135;
					if(global.difficulty == diff_modes.normal){	
						p = instance_create_depth(x,y,depth, obj_blade_man_blade);
						p.dir_angle = 90;
					}
					if(global.difficulty == diff_modes.hard){	
						p = instance_create_depth(x,y,depth, obj_blade_man_blade);
						p.dir_angle = 90 + 360 / 16;
						p = instance_create_depth(x,y,depth, obj_blade_man_blade);
						p.dir_angle = 90 - 360 / 16;
					}
				break;
				case(BLADE_LOCATION.FLOOR):
					var add = (dir == 1 ? 0 : 180)
					var p = instance_create_depth(x,y,depth, obj_blade_man_blade);
					p.dir_angle = 45 + add;
					p = instance_create_depth(x,y,depth, obj_blade_man_blade);
					p.dir_angle = 0 + add;
					if(global.difficulty == diff_modes.normal){	
						p = instance_create_depth(x,y,depth, obj_blade_man_blade);
						p.dir_angle = 9 + add;
					}
					if(global.difficulty == diff_modes.hard){	
						p = instance_create_depth(x,y,depth, obj_blade_man_blade);
						p.dir_angle = 0 + 360 / 16 + add;
						p = instance_create_depth(x,y,depth, obj_blade_man_blade);
						p.dir_angle = 45 + 360 / 16 + add;
					}
				break;
				case(BLADE_LOCATION.WALL):
					var add = (dir == 1 ? 0 : 180)
					var p = instance_create_depth(x,y,depth, obj_blade_man_blade);
					p.dir_angle = 315 + add;
					p = instance_create_depth(x,y,depth, obj_blade_man_blade);
					p.dir_angle = 45 + add;
					if(global.difficulty == diff_modes.normal){	
						p = instance_create_depth(x,y,depth, obj_blade_man_blade);
						p.dir_angle = 0 + add;
					}
					if(global.difficulty == diff_modes.hard){	
						p = instance_create_depth(x,y,depth, obj_blade_man_blade);
						p.dir_angle = 0 + 360 / 16 + add;
						p = instance_create_depth(x,y,depth, obj_blade_man_blade);
						p.dir_angle = 0 - 360 / 16 + add;
					}
				break;
			}
			
			if(t == 30 + idle_limit){
				state_set(BLADE_MAN.DIVEBOMB)
			}
		}		
	break;
	case(BLADE_MAN.DIVEBOMB):
		if(hp != hp_start_of_swing){
			state_set(BLADE_MAN.DASH);
		}
		
		if(t == 0){
			pl_x = global.player_x;
			pl_y = global.player_y;
		}
		
		move_towards_point(pl_x, pl_y, dash_speed);
		
		if(is_on_floor()){
			state_set(boss_states.idle);
		}
	break;
}