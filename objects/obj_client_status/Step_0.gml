if(player != noone){
	var _p = instance_create_depth(global.player_x, global.player_y, 0, obj_player_online);
	global.client.players[player] = _p;
	player = noone;
	global.player_Server_update = false;
}