function GameClient(_ip, _port) : TCPSocket(_ip, _port) constructor {
	ping = 0;
	nickname = "";
	player_x = [];
	player_y = [];
	player_sprite = [];
	player_frame = [];
	player_dir = [];
	tick_rate = global.tick_rate;
	tick_timer = 0;
	sendPing = function() {
        // Wait 1 second to send ping
        call_later(1, time_source_units_seconds, function() {
            rpc.sendRequest("ping", current_time)
                .onCallback(function(_result) {
                    var _ping = current_time - _result;
					ping = _ping;
                    //show_debug_message($"{_ping} ms");
                })
                .onError(function(_error) {
                    //show_debug_message($"Error {_error.code}: {_error.message}");    
                })
                .onFinally(function() {
                    sendPing();
                });
        });
    }
	
	pingProjectile = function(_shot) {
        rpc.sendNotification("spawn_shot", _shot);
    }
	
	pingChat = function(_string) {
        // Wait 1 second to send ping
        rpc.sendNotification("chat", _string);
    }
	
	rpc.registerHandler("spawn_pickup_2", function(_pos) {
		instance_create_depth(_pos.x, _pos.y, 0, obj_pickup_life_2);
	});
	
	rpc.registerHandler("chat", function(_pos) {
		var _chat = instance_create_depth(0, 0, 0, obj_chat);
		_chat.strin = _pos;
	});
	
	rpc.registerHandler("spawn_shot", function(_pos) {
		if(_pos[4] == global.player_server_id) return;
		var _p = instance_create_depth(_pos[1], _pos[2], 0, _pos[0]);
		_p.dir = _pos[3];
		_p.image_xscale = _p.dir;
		_p.owner = _p;
		_p.shot_angle = _pos[4];
	});
	
	rpc.registerHandler("update_x_pos", function(_pos) {
		array_set(global.player_xs, _pos[1], _pos[0]);
		//log(_pos[1])
	});
	
	rpc.registerHandler("update_y_pos", function(_pos) {
		array_set(global.player_ys, _pos[1], _pos[0]);
		//log(_pos[1])
	});
	
	rpc.registerHandler("update_sprite", function(_pos) {
		array_set(global.player_sprites, _pos[1], _pos[0]);
		//log(_pos[1])
	});
	
	rpc.registerHandler("update_frame", function(_pos) {
		array_set(global.player_frames, _pos[1], _pos[0]);
		//log(_pos[1])
	});
	
	rpc.registerHandler("update_dir", function(_pos) {
		array_set(global.player_dirs, _pos[1], _pos[0]);
		//log(_pos[1])
	});
	
	rpc.registerHandler("update_player_char", function(_pos) {
		array_set(global.player_chars, _pos[1], _pos[0]);
		//log(_pos[1])
	});
	
	rpc.registerHandler("update_names", function(_pos) {
		array_set(global.player_names, _pos[1], _pos[0]);
		//log(_pos[1])
	});
	
	rpc.registerHandler("update_palette", function(_pos) {
		array_set(global.player_palettes, _pos[1], _pos[0]);
		//log(_pos[1])
	});
	
	rpc.registerHandler("update_player_id", function(_pos) {
		log("ID's!")
		global.player_server_id = _pos;
	});
	
	rpc.registerHandler("change_room", function(_pos) {
		log("roomies!");
		if(room != _pos[0])
			room_goto(_pos[0]);
	});
	
	is_connected = false;
	
	setEvent("connected", function() {
		is_connected = true;
		var _chr = pl_char.x;
		if(instance_exists(obj_player_zero))
			_chr = pl_char.zero
		if(instance_exists(obj_player_axl))
			_chr = pl_char.axl
		if(instance_exists(obj_player_megaman))
			_chr = pl_char.megaman
		var _nick = get_string("Username", global.username);
		global.username = _nick;
		settings_save();
		sendPing();
		rpc.sendNotification("room_join");
		rpc.sendNotification("set_nickname", _nick);
		rpc.sendNotification("update_player_char", _chr);
	});
	
	setEvent("step", function() {
		if(!is_connected || !instance_exists(obj_player_parent)) return;
		if(keyboard_check_pressed(ord("1"))){
			var _pos = {x : mouse_x, y : mouse_y};
			//request expects response, notification does not expect anything in return
			rpc.sendNotification("spawn_pickup_2", _pos);
		}
		var _x = instance_nearest(0,0,obj_player_parent).x;
		var _y = instance_nearest(0,0,obj_player_parent).y;
		_x = floor(_x);
		_y = floor(_y);
		var _info = [_x,_y,spr_x_idle,0];
		//log(_info);
		if(tick_timer > 60 / tick_rate){
			if(instance_exists(obj_player_parent))
			var _spr = instance_nearest(0,0,obj_player_parent).pl_sprite[0];
			var _frm = instance_nearest(0,0,obj_player_parent).image_index;
			var _dir = instance_nearest(0,0,obj_player_parent).dir;
			var _plt = global.player_palette_index;
			rpc.sendNotification("update_x_pos",   _x);
			rpc.sendNotification("update_y_pos",   _y);
			rpc.sendNotification("update_sprite",  _spr);
			rpc.sendNotification("update_frame",   _frm);
			rpc.sendNotification("update_dir",     _dir);
			rpc.sendNotification("update_palette", _plt);
			
			if(global.chat_string != ""){
				rpc.sendNotification("chat", global.chat_string);
				global.chat_string = "";
			}
			tick_timer = 0;
		} else {
			tick_timer++;
		}
	});
	
	setEvent("draw", function() {
		draw_sprite(spr_pickup_life_3,0,global.player_x, global.player_y)
	});
	
	start();
}