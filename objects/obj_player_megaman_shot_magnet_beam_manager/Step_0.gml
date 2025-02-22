var bm = instance_create_depth(x,y,depth,obj_player_megaman_shot_magnet_beam);
offset+= 4;
x += 4 * dir;
bm.beam_tip_offset = offset + 4;
bm.dir = dir;
if(dir == -1)
bm.anim_offset = 2 - frame_offset;
else
bm.anim_offset = frame_offset;
bm.fuckin_id_id = fuckin_id;
bm.anim_frame = anim_offset;
anim_offset += 0.25;

if(frame_offset == 0){
	frame_offset++;
}

scr_keys_update();
if(!key_shoot){
	frame_offset += dir;
	with(obj_player_parent){
		shots_count--;
	}
	bm.anim_offset = frame_offset;
	instance_destroy();
}