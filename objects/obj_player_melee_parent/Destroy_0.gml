/*if (instance_exists(obj_player_parent))
{
	with (obj_player_parent)
	{
	shots_count -= 1;	
	}
}*/

room_speed = 60;
if(global.is_online){
	global.client.KillProjectile(self);
}