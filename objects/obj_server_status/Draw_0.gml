if (room != rm_lobby) return;
var _count = global.server.clients.getCount();
var _rate = game_get_speed(gamespeed_fps);
draw_string(x + 16, y + 16, "Total Client: " + string(_count));
draw_string(x + 16, y + 32, "Network Rate: " + string(_rate));

draw_string(x + 16, y + 96, "Room: " + room_names[current_room]);
draw_string(x + 16, y + 102, "> " + room_names[room_id] + " <");