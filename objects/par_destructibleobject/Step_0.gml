enum blockie {normal, grabbed, thrown}
if(status == blockie.normal)
	enemy_behavior_normal();
else if(status == blockie.grabbed){
	var _dir = instance_nearest(x,y,obj_player_parent).dir;
	x = global.player_x + 8 * _dir;
	y = global.player_y - (16 + sprite_height/2);
} else {
	x += 3 * dir;
	y += 0.25;
	if(is_on_floor()){
		
		for(var w = 0; w < 4; w++){
			var p = instance_create_depth(x + w * 16,y,depth, obj_player_megaman_shot_brick);
			p.brick_tex = sprite_index;
			p.v_speed = (w mod 2) * -1;
			p.h_speed = 3 * dir;
			p.brick_splinter_num = w;
		}
		instance_destroy();
	}
}