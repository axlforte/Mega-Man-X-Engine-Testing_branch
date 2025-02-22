
//event_inherited();
var _xoff = 0;
var _yoff = 0;
if(status = oil.sliding){
	_xoff = floor(global.player_x);
	_yoff = global.player_y + 16;
} else {
	_xoff = x;
	_yoff = y;
}

draw_sprite_ext(sprite_index,animation_i, _xoff, _yoff, 1, 1, rot, c_white, 1);