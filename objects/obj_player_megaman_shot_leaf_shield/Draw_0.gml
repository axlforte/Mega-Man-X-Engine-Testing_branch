var _ang = angle;
var _xo = sin(_ang / 180 * pi) * angle_dist;
var _yo = cos(_ang / 180 * pi) * angle_dist;
var _spr_ind = (angle_dist != angle_dist_max ? ((angle_dist / angle_dist_max) * 7) : (timer / 4 mod 4) + 8);
draw_sprite(sprite_index, _spr_ind, x + _xo, y + _yo);
_ang += 90;
_xo = sin(_ang / 180 * pi) * angle_dist;
_yo = cos(_ang / 180 * pi) * angle_dist;
draw_sprite(sprite_index, _spr_ind, x + _xo, y + _yo);
_ang += 90;
_xo = sin(_ang / 180 * pi) * angle_dist;
_yo = cos(_ang / 180 * pi) * angle_dist;
draw_sprite(sprite_index, _spr_ind, x + _xo, y + _yo);
_ang += 90;
_xo = sin(_ang / 180 * pi) * angle_dist;
_yo = cos(_ang / 180 * pi) * angle_dist;
draw_sprite(sprite_index, _spr_ind, x + _xo, y + _yo);

if(is_power_geared){
	draw_sprite(sprite_index, timer mod 4, x, y - timer * 8);
	draw_sprite(sprite_index, timer mod 4, x, y - timer * 8 - 8);
	draw_sprite(sprite_index, timer mod 4, x, y - timer * 8 + 8);
	draw_sprite(sprite_index, timer mod 4, x, y - timer * 8 + 16);
}