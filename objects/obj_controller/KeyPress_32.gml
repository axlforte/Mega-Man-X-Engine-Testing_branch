var _ip = get_string_async("IP", "127.0.0.1");
var _port = get_integer_async("Port", 3000);
global.client = new GameClient(_ip, _port);
instance_create_depth(0, 0, 0, obj_client_status);
instance_create_depth(0, 0, 0, obj_lobby);
instance_destroy();
room_goto(rm_lobby);