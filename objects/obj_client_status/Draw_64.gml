draw_string_here(0, 0, $"Ping:{global.client.ping}", colors.orange, false);
draw_string_here(0, 8, (global.client.connected ? "CONNECTED" : "OFFLINE"), colors.orange, false);
global.chat.draw();