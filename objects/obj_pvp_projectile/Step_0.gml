/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(alength(global.client.shots) >= client_shot_id){
	if(alength(global.client.shots[client_shot_id]) >= server_shot_id){
		if(global.client.shots[client_shot_id][server_shot_id] == -1) {
			instance_destroy();
		}
	}
}
if(global.player_server_id == client_shot_id) instance_destroy();