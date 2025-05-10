var own = instance_nearest(x,y,obj_player_parent);
image_xscale = own.dir;
if own.state == states.jump {
	ang = 75 * image_xscale;	
	image_yscale = 1;
} else if own.state = states.fall {
	ang = -90 * image_xscale;	
	image_yscale = -1;
} else if(own.state != states.dash) instance_destroy();

x = global.player_x;
y = global.player_y;

draw_sprite_ext(sprite_index,timer++,x,y,image_xscale,image_yscale,ang,c_white,0.75);