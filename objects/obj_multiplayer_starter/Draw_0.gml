draw_set_color(c_white)
draw_rectangle(x,y,x + 96, y + 32, false);
var _ip = ip_string;
draw_string(x,y,_ip);
if(changing_number)
draw_string(x,y + 16, keyboard_string);

//gonna need some scratch space, need to think this out
var _off = string_length(string(ip[0]));
if(num > 0){
	_off += 1;
	_off += string_length(string(ip[1]));
}
if(num > 1){
	_off += 1;
	_off += string_length(string(ip[2]));
}
if(num > 2){
	_off += 1;
	_off += string_length(string(ip[3]));
}
_off -= 1 + (3/8);
if(changing_number)
	draw_sprite(spr_zero_pickup_lifeup, 0, x + _off * 8, y + 8)
else
	draw_sprite(spr_x_pickup_lifeup, 0, x + _off * 8, y + 8)
	draw_string(x,y + 24,string(server));