if(!released)
	draw_sprite(sprite_index, (timer > 45 ? 11 : (timer / 45) * 10 + 1),x,y);
else
	draw_sprite(sprite_index, (timer > 45 ? 11 : 0),x,y);