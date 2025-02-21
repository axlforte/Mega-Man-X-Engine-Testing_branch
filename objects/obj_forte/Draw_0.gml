if(timer > 180){
	draw_sprite(sprite_index,0,x,y);
	timer = 0;
} else if(timer > leave){
	draw_sprite(sprite_index,1,x,y);
} else if(timer > hold){
	draw_sprite(sprite_index,2,x,y);
} else if(timer > enter){
	draw_sprite(sprite_index,1,x,y);
} else {
	draw_sprite(sprite_index,0,x,y);
}
timer++;