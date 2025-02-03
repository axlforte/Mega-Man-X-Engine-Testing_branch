/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	
	if(t mod 8 == 0){
		x = global.player_x + 32;
		y = global.player_y;
	} else if(t mod 8 == 1){
		x = global.player_x + 24;
		y = global.player_y + 24;
	} else if(t mod 8 == 2){
		x = global.player_x;
		y = global.player_y + 32;
	} else if(t mod 8 == 3){
		x = global.player_x - 24;
		y = global.player_y + 24;
	} else if(t mod 8 == 4){
		x = global.player_x - 32;
		y = global.player_y;
	} else if(t mod 8 == 5){
		x = global.player_x - 24;
		y = global.player_y - 24;
	} else if(t mod 8 == 6){
		x = global.player_x;
		y = global.player_y - 32;
	} else {
		x = global.player_x + 24;
		y = global.player_y - 24;
	}
	
	if(t > 24){
		instance_destroy();
	}

	if (t == 2)
	{
		animation_play("L");	
	}
}