var t = timer++;
accel_type = 1;
if (auto_rotate && t > homing_limit_min) {
	var dd = angle_difference(dir_angle, (dir == 1) ? 0 : 180);
	if (abs(dd) > 30) {
		dir_angle -= 2*sign(dd);	
	}
}
if ((t > 20 && is_inside_view()) || t > homing_limit_max) {
	persist = false;
}
if (t == homing_limit_min && shot_type == 2) {
	acceleration *= 2;	
}
if (accel_type == 1)
	abs_speed = min(abs_speed_max, abs_speed + acceleration);
h_speed = lengthdir_x(abs_speed, dir_angle);
v_speed = lengthdir_y(abs_speed, dir_angle);
// Animation
var angle = point_direction(x, y, x + h_speed, y + v_speed);
animation_i = round((angle / 360) * 16);
if (dir == -1)
	animation_i = 8 - animation_i + image_number;
image_index = animation_i;