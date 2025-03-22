/*if (instance_exists(obj_player_parent))
{
	with (obj_player_parent)
	{
	shots_count -= 1;	
	}
}*/

room_speed = 60;
if(global.is_online){
	global.client.shots[client_shot_id][server_shot_id] = -1;
}