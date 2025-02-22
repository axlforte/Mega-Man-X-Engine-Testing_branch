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
	player_y_vel = [];
	player_x_vel = [];
	current_room = rm_headquarters;
	
	leaveRoom = function(_client) {
        var _socket = _client.socket;
        var _index = array_get_index(roomSockets, _socket);
        if (_index != -1) {
            array_delete(roomSockets, _index, 1);
            array_delete(player_x, _index, 1);
            array_delete(player_y, _index, 1);
            array_delete(player_sprite, _index, 1);
            array_delete(player_frame, _index, 1);
            array_delete(player_dir, _index, 1);
            array_delete(player_palette, _index, 1);
            array_delete(nicknames, _index, 1);
        }
		//log($"{_client.nickname} left the room");
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
	
	rpc.registerHandler("update_position", function(_info, _socket) {
		//log("i was pinged i work i swear")
		//log(_info);
		_socket.x = _info.x;
		_socket.y = _info.y;
		_socket.sprite = _info.sprite;
		_socket.frame = _info.frame;
		//log(_socket);
    });
	
	rpc.registerHandler("update_x_pos", function(_info, _socket) {
		//log(_info);
		player_x[_socket.id] = _info;
		//log(_socket);
    });
	
	
	rpc.registerHandler("update_y_pos", function(_info, _socket) {
		//log(_info);
		player_y[_socket.id] = _info;
		//log(_socket);
    });
	
	rpc.registerHandler("update_sprite", function(_info, _socket) {
		//log(_info);
		player_sprite[_socket.id] = _info;
		//log(_socket);
    });
	
	rpc.registerHandler("update_frame", function(_info, _socket) {
		//log(_info);
		player_frame[_socket.id] = _info;
		//log(_socket);
    });
	
	rpc.registerHandler("update_dir", function(_info, _socket) {
		//log(_info);
		player_dir[_socket.id] = _info;
		//log(_socket);
    });
	
	rpc.registerHandler("update_palette", function(_info, _socket) {
		//log(_info);
		player_palette[_socket.id] = _info;
		//log(_socket);
    });
	
	rpc.registerHandler("update_x_vel", function(_info, _socket) {
		//log(_info);
		player_x_vel[_socket.id] = _info;
		//log(_socket);
    });
	
	rpc.registerHandler("update_y_vel", function(_info, _socket) {
		//log(_info);
		player_y_vel[_socket.id] = _info;
		//log(_socket);
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
			//log(roomSockets)
			//log(player_x);
			//log(player_y);
			for(var q = 0; q < array_length(player_x); q++){
				if(q < array_length(player_x))
					rpc.sendNotification("update_x_pos", [player_x[q], q], roomSockets);
				if(q < array_length(player_y))
					rpc.sendNotification("update_y_pos", [player_y[q], q], roomSockets);
				if(q < array_length(player_sprite))
					rpc.sendNotification("update_sprite", [player_sprite[q], q], roomSockets);
				if(q < array_length(player_frame))
					rpc.sendNotification("update_frame", [player_frame[q], q], roomSockets);
				if(q < array_length(player_dir))
					rpc.sendNotification("update_dir", [player_dir[q], q], roomSockets);
				if(q < array_length(nicknames))
					rpc.sendNotification("update_names", [nicknames[q], q], roomSockets);
				if(q < array_length(player_palette))
					rpc.sendNotification("update_palette", [player_palette[q], q], roomSockets);
			}
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