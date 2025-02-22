function GameServer(_port) : TCPServer(_port) constructor{
	roomSockets = [];
	nicknames = [];
	tick_rate = global.tick_rate;
	tick_timer = 0;
	player_x = [];
	player_y = [];
	player_sprite = [];
	player_frame = [];
	player_dir = [];
	player_char = [];
	player_palette = [];
	player_x_vel = [];
	player_y_vel = [];
	player_grav = [];
	current_room = rm_headquarters;
	
	leaveRoom = function(_client) {
        var _socket = _client.socket;
        var _index = array_get_index(roomSockets, _socket);
        if (_index != -1) {
            array_delete(roomSockets, _index, 1);
            array_delete(player_x, _index, 1);
            array_delete(player_x_vel, _index, 1);
            array_delete(player_y, _index, 1);
            array_delete(player_y_vel, _index, 1);
            array_delete(player_sprite, _index, 1);
            array_delete(player_frame, _index, 1);
            array_delete(player_dir, _index, 1);
            array_delete(player_palette, _index, 1);
            array_delete(nicknames, _index, 1);
        }
		rpc.sendNotification("haul_ass", true, roomSockets);
    }
	
	change_room = function(_room) {
		//log(_room);
		current_room = _room;
		rpc.sendNotification("change_room", [_room,true], roomSockets);
    }
	
	rpc.registerHandler("ping", function(_time, _socket) {
		//log("i was pinged i work i swear")
        return _time;
    });
	
	rpc.registerHandler("chat", function(_time, _socket) {
		//log(_time)
        rpc.sendNotification("chat", _time, roomSockets);
    });
	
	rpc.registerHandler("update_all", function(_info, _socket) {
		//log(_info);
		player_x[_socket.id] = _info[0];
		player_y[_socket.id] = _info[1];
		player_sprite[_socket.id] = _info[2];
		player_frame[_socket.id] = _info[3];
		player_dir[_socket.id] = _info[4];
		player_palette[_socket.id] = _info[5];
		player_x_vel[_socket.id] = _info[6];
		player_y_vel[_socket.id] = _info[7];
		player_grav[_socket.id] = _info[8];
		rpc.sendNotification("update_all", [
			_socket.id,
			player_x[_socket.id],
			player_y[_socket.id],
			player_sprite[_socket.id],
			player_frame[_socket.id],
			player_dir[_socket.id],
			player_char[_socket.id],
			nicknames[_socket.id],
			player_palette[_socket.id],
			player_x_vel[_socket.id],
			player_y_vel[_socket.id],
			player_grav[_socket.id]
			], roomSockets);
		//log(_socket);
    });
	
	rpc.registerHandler("update_player_id", function(_info, _socket) {
		rpc.sendNotification("update_player_id", _socket.id, _socket.socket);
	});
	
	rpc.registerHandler("update_player_char", function(_info, _socket) {
		//log(_info);
		//log("char updated")
		player_char[_socket.id] = _info;
		for(var q = 0; q < array_length(player_char); q++){
			rpc.sendNotification("update_player_char", [player_char[q], q], roomSockets);
		}
		//log(_socket);
    });
	
	rpc.registerHandler("spawn_pickup_2", function(_pos, _client) {
		//log("put a dispenser here!")
        //rpc.sendNotification("spawn_pickup_2", _pos, sockets);
		//log(roomSockets);
		//log(_client);
		/*for(var q = 0; q < array_length(roomSockets); q++){
			rpc.sendNotification("spawn_pickup_2", _pos, roomSockets[q]);
		}*/
		rpc.sendNotification("spawn_pickup_2", _pos, roomSockets);
    });
	
	rpc.registerHandler("spawn_shot", function(_pos, _client) {
		rpc.sendNotification("spawn_shot", _pos, roomSockets);
    });
	
	rpc.registerHandler("room_join", function(_param, _client){
		//log("joined room")
		array_push(roomSockets, _client.socket)
		rpc.sendNotification("change_room", [current_room], _client.socket);
	});
	
	rpc.registerHandler("set_nickname", function(_nick, _client){
		//log("new nickname set")
		_client.nickname = _nick;
		nicknames[_client.id] = _nick;
		for(var q = 0; q < array_length(nicknames); q++){
			rpc.sendNotification("update_names", [nicknames[q], q], roomSockets);
		}
		//array_push(nicknames, _nick);
	});
	
	setEvent("error", function(_err) {
        show_debug_message(_err);
    });
	
	setEvent("step", function(){
		if(tick_timer > 60 / tick_rate){
			// i moved all the proper checks to be seperate. no reason to keep them together, but i
			// still need to make an update_everything call
			tick_timer = 0;
		} else {
			tick_timer++;
		}
	});
	
	setEvent("connected", function(_client){
		rpc.sendNotification("update_player_id", _client.id, _client.socket);
		rpc.sendNotification("update_player_char", global.character_selected[0], _client.socket);
	});
	
	setEvent("disconnected", function(_client) {
		leaveRoom(_client);
	});
	
	createClient = function(_id, _socket) {
        return new ConnectedClient(_id, _socket);
    }
	
	start();
}

function ConnectedClient(_id, _socket) : BaseClient(_id, _socket) constructor {
	self.nickname = "";
	self.x = 0;
	self.y = 0;
	self.sprite = spr_x_idle;
	self.frame = 0;
}