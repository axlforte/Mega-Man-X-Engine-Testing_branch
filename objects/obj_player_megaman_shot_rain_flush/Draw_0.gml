if(timer < angle_dist_max){
	draw_sprite(sprite_index, 0, x, y - timer * (320 / angle_dist_max));
} else {
	mask_index = rain_flush_hitbox;
	depth = -10000;
	draw_sprite_tiled(rain_flush_rain, timer / 6, timer * -1,timer);
}