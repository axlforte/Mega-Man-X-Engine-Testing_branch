draw_set_color(c_white)
draw_rectangle(x,y,x + 96, y + 32, false);
var _ip = ip_string;
draw_string_here(x,y,_ip);
if(changing_number)
	draw_string_here(x,y + 16, keyboard_string);
draw_string_here(x,y + 24,array_get(["SERVER:FALSE", "SERVER:TRUE"],server));