draw_set_color(c_white)
draw_rectangle(x,y,x + 96, y + 32, false);
var _ip = ip_string;
if(changing_number)
	draw_string_here(x,y, keyboard_string);
else
	draw_string_here(x,y,_ip);
draw_string_here(x,y + 12,array_get(["SERVER:FALSE", "SERVER:TRUE"],server));
draw_string_here(x,y + 24,array_get(["PVP:FALSE", "PVP:TRUE"],friendly_fire));