/// @description Step
event_inherited();

x += dir * 4;
if(ignore_coll < 0 && !die_now){
	if(instance_place(x,y + diag * 2,obj_block_parent)){
		var p = instance_create_depth(x,y,depth,obj_player_megaman_shot_dust_crushettes);
		p.v_speed = 3;
		p.h_speed = 3;
		p = instance_create_depth(x,y,depth,obj_player_megaman_shot_dust_crushettes);
		p.v_speed = -3;
		p.h_speed = 3;
		p = instance_create_depth(x,y,depth,obj_player_megaman_shot_dust_crushettes);
		p.v_speed = 3;
		p.h_speed = -3;
		p = instance_create_depth(x,y,depth,obj_player_megaman_shot_dust_crushettes);
		p.v_speed = -3;
		p.h_speed = -3;
		instance_destroy();
	}
}
	
if(ignore_coll >= 0){
	ignore_coll--;
}

if(die_now){
	if(anim_offset > 1)
		instance_destroy();
	anim_offset++;
} else if(anim_offset > 0){
	anim_offset--;
}