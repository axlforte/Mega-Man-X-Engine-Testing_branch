draw_sprite(sprite_index, boom_index, x, y);
if(ground_bounces < 3 && timer < fuse_timer){
	draw_sprite(spr_hyper_bomb_fuse, timer, x, y - 8);
}