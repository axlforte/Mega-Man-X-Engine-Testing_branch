
if(explosion_type == nesboom.mm1){
	if(timer mod 4 == 0){
		for(var e = 0; e < 8; e++){
			var p = instance_create_depth(x + irandom_range(-32,32),y + irandom_range(-32,32),depth, explode_FX_classic);
			p.brightness = 4 - (timer / 8) - (e / 4);
			p.h_speed = (x - p.x) / -16;
			p.v_speed = (y - p.y) / -16;
		}
	}
	if timer > 8{
		instance_destroy();
	}
} else if(explosion_type == nesboom.mm2){
	if(timer mod 8 == 0){
		for(var e = 0; e < 4; e++){
			var p = instance_create_depth(x + irandom_range(-32,32),y + irandom_range(-32,32),depth, explode_FX_classic);
			p.brightness = 4 - (timer / 8);
			p.h_speed = (x - p.x) / -32;
			p.v_speed = (y - p.y) / -32;
		}
	}
	if timer > 32{
		instance_destroy();
	}
} else {
	if(timer == 0){
		var p = instance_create_depth(x + boom_4[0][0],y + boom_4[0][1],depth, explode_FX_classic);
		p.brightness = 4
	} else if(timer == 2){
		var p = instance_create_depth(x + boom_4[1][0],y + boom_4[1][1],depth, explode_FX_classic);
		p.brightness = 3
		p = instance_create_depth(x + boom_4[5][0],y + boom_4[5][1],depth, explode_FX_classic);
		p.brightness = 3
	} else if(timer == 4){
		var p = instance_create_depth(x + boom_4[2][0],y + boom_4[2][1],depth, explode_FX_classic);
		p.brightness = 2
		p = instance_create_depth(x + boom_4[6][0],y + boom_4[6][1],depth, explode_FX_classic);
		p.brightness = 2
	} else if(timer == 6){
		var p = instance_create_depth(x + boom_4[3][0],y + boom_4[3][1],depth, explode_FX_classic);
		p.brightness = 1
		p = instance_create_depth(x + boom_4[7][0],y + boom_4[7][1],depth, explode_FX_classic);
		p.brightness = 1
	} else if(timer == 8){
		var p = instance_create_depth(x + boom_4[4][0],y + boom_4[4][1],depth, explode_FX_classic);
		p.brightness = 0
		p = instance_create_depth(x + boom_4[8][0],y + boom_4[8][1],depth, explode_FX_classic);
		p.brightness = 0
	} else {
		
	}
	if timer > 32{
		instance_destroy();
	}
}
timer++;