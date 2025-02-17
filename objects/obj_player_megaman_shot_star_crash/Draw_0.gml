var _ang = angle;
var _xo = sin(_ang / 180 * pi) * angle_dist;
var _yo = cos(_ang / 180 * pi) * angle_dist;
var _spr_ind = _ang / (360 / 5 / 4);

//360 degrees is a full rotation, a star looks the same when rotates 1/5th the way,
//and there are 4 frames to the star rotation animation

draw_sprite(sprite_index, _spr_ind, x + _xo, y + _yo);
draw_star_crash_trail(_ang);
_ang += 120;
_xo = sin(_ang / 180 * pi) * angle_dist;
_yo = cos(_ang / 180 * pi) * angle_dist;
_spr_ind = _ang / (360 / 5 / 4);
draw_sprite(sprite_index, _spr_ind, x + _xo, y + _yo);
draw_star_crash_trail(_ang);
_ang += 120;
_xo = sin(_ang / 180 * pi) * angle_dist;
_yo = cos(_ang / 180 * pi) * angle_dist;
_spr_ind = _ang / (360 / 5 / 4);
draw_sprite(sprite_index, _spr_ind, x + _xo, y + _yo);
draw_star_crash_trail(_ang);