if(teleport){
	teleport = false;
	var tran = transition_create(transition_types.fade_out_and_fade_in);
	tran.color = c_black;
	tran.transition_limit = 25;
	t_timer = 27;
	animation_play("O");
}
if(t_timer > 0){
	if(t_timer == 15 && instance_exists(obj_player_parent)){
		var _p = instance_nearest(x,y,obj_player_parent);
		_p.x = tp_x;
		_p.y = tp_y + 8;
		with(_p){
			move_down();
		}
		G.current_camera = camera_id;
		if(instance_exists(obj_camera_rds)){
			var _rds = instance_nearest(x,y,obj_camera_rds);
			_rds.x = cam_x;
			_rds.y = cam_y;
			__view_set(e__VW.XView,0,cam_x);
			__view_set(e__VW.YView,0,cam_y);
		}
	} else if(t_timer == 1){
		with(obj_teleporter){
			animation_play("C")
		}
	}
	t_timer--;
}