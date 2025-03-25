event_inherited();
			//logic goes here
var _shots = -1;

for(var e = 0; e < alength(G.client.shots); e++){
	for(var f = 0; f < alength(G.client.shots[e]); f++){
		if(alength(G.client.shots[e][f]) > 0)
			if(G.client.shots[e][f][6] == server_shot_id)
				_shots = G.client.shots[e][f];
	}
}
			
if(_shots == -1) {
	instance_destroy();
} 
if(alength(_shots) > 2){
	sprite_index = _shots[0];
	image_index = _shots[1];
	x = _shots[2];
	y = _shots[3];
	v_speed = _shots[4];
	h_speed = _shots[5];
	image_xscale = _shots[9];
	dir = _shots[9];
	atk = _shots[10];
				
	if(atk <= 0){
		hurt_players = false;
	} else {
		hurt_players = global.pvp;
	}
}

 if( kys_t > kys_lim){
	instance_destroy();
}
			kys_t++;

if(G.player_server_id == client_shot_id) instance_destroy();