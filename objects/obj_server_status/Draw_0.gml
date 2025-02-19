if (room != rm_lobby) return;
var _count = global.server.clients.getCount();
var _rate = game_get_speed(gamespeed_fps);
draw_string(x + 16, y + 16, "Total Client Count: " + string(_count));
draw_string(x + 16, y + 32, "Network Rate: " + string(_rate));

draw_string(x + 16, y + 64, "Room: " + room_names[current_room]);
draw_string(x + 16, y + 82, "> " + room_names[room_id] + " <");

for(var e = 0; e < array_length(global.server.nicknames); e++){
	draw_string(x + 24, y + 100 + e * 10, global.server.nicknames[e]);
}