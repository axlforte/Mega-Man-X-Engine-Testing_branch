coll.x = x - 2;
coll.y = y - 3;
anim_frame += 0.25;

if(instance_exists(obj_player_megaman_shot_magnet_beam_manager)){
	if(instance_nearest(x,y,obj_player_megaman_shot_magnet_beam_manager).fuckin_id == fuckin_id_id){
		x = obj_player_megaman_shot_magnet_beam_manager.x + (beam_tip_offset - obj_player_megaman_shot_magnet_beam_manager.offset) * dir;
		y = obj_player_megaman_shot_magnet_beam_manager.y;
	} else {
		
	}
}

d_time--;
if(d_time < 0)
	instance_destroy();