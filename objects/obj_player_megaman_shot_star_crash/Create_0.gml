event_inherited();
sound = snd_megaman_shot_2;

abs_hspeed = 0;
atk = 2;
blocking = true;
angle = 45;
angle_rotation_speed = 5;
angle_dist = 0;
angle_dist_max = 28;
detached = false;
dir = 1;
power_gear_made_projectiles = false;
is_power_geared = instance_nearest(x,y,obj_player_parent).power_gear;

scr_keys_reset();

execute_step_in_first_frame = true;

function draw_star_crash_trail(){
	var _a = argument[0];
	var _x = x
	var _y = y
	_x = sin(_a / 180 * pi) * angle_dist + x;
	_y = cos(_a / 180 * pi) * angle_dist + y;
	draw_sprite_ext(spr_star_crash_trail, 0, _x, _y, 1, -1,_a,c_white,1);
	_a -= 10;
	_x = sin(_a / 180 * pi) * angle_dist + x;
	_y = cos(_a / 180 * pi) * angle_dist + y;
	draw_sprite_ext(spr_star_crash_trail, 1, _x, _y, 1, -1,_a,c_white,1);
	_a -= 8;
	_x = sin(_a / 180 * pi) * angle_dist + x;
	_y = cos(_a / 180 * pi) * angle_dist + y;
	draw_sprite_ext(spr_star_crash_trail, 2, _x, _y, 1, -1,_a,c_white,1);
	_a -= 8;
	_x = sin(_a / 180 * pi) * angle_dist + x;
	_y = cos(_a / 180 * pi) * angle_dist + y;
	draw_sprite_ext(spr_star_crash_trail, 3, _x, _y, 1, -1,_a,c_white,1);
	_a -= 5;
	_x = sin(_a / 180 * pi) * angle_dist + x;
	_y = cos(_a / 180 * pi) * angle_dist + y;
	draw_sprite_ext(spr_star_crash_trail, 4, _x, _y, 1, -1,_a,c_white,1);
}