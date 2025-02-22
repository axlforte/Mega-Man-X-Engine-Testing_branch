/// @description Step
event_inherited();

x += dir * 2;
if(ignore_coll < 0 && !die_now){
	if(instance_place(x + dir * 2,y,obj_block_parent)){
		var p = instance_create_depth(x,y,depth,obj_player_megaman_shot_crystal_shards);
		p.dir = dir * -1;
		if(diag == 0){
			p.diag = -1;
		} else {
			p.diag = diag;
		}
		p.bounce_limit = bounce_limit - 1;
		die_now = true;
	}
}

y += diag * 2;
if(ignore_coll < 0 && !die_now){
	if(instance_place(x,y + diag * 2,obj_block_parent)){
		var p = instance_create_depth(x,y,depth,obj_player_megaman_shot_crystal_shards);
		p.diag = diag * -1;
		p.dir = dir;
		p.bounce_limit = bounce_limit - 1;
		die_now = true;
	}
}
	
if(ignore_coll >= 0){
	ignore_coll--;
}

if(die_now || bounce_limit < 1){
	if(anim_offset > 1)
		instance_destroy();
	anim_offset++;
} else if(anim_offset > 0){
	anim_offset--;
}