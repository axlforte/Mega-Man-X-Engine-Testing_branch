function GameClient(_ip, _port) : TCPSocket(_ip, _port) constructor {
	ping = 0;
	nickname = "";
	players = [];
	enemies = [];
	tick_rate = global.tick_rate;
	tick_timer = 0;
	sendPing = function() {
        // Wait 1 second to send ping
        call_later(1, time_source_units_seconds, function() {
            rpc.sendRequest("ping", current_time)
                .onCallback(function(_result) {
                    var _ping = current_time - _result;
					global.ping = _ping;
                })
                .onError(function(_error) { 
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
        rpc.sendNotification("chat", _string);
    }
	
	spawn_enemy = function(_params) {
		 rpc.sendNotification("spawn_enemy", _params);
	}
	
	hurt_enemy = function(_params) {
		 rpc.sendNotification("Hurt_enemy", _params);
	}
	
	rpc.registerHandler("haul_ass", function(_pos) {
		global.player_xs = [];
		global.player_ys = [];
		global.player_sprites = [];
		global.player_frames = [];
		global.player_dirs = [];
		global.player_chars = [];
		global.player_names = [];
		global.player_palettes = [];
		global.player_x_vel = [];
		global.player_y_vel = [];
		global.player_key_lefts = [];
		global.player_key_rights = [];
		global.player_key_downs = [];
		var _nick = global.username;
		rpc.sendNotification("set_nickname", _nick);
		rpc.sendNotification("update_player_id", _nick);
	});
	
	rpc.registerHandler("chat", function(_pos) {
		var _chat = instance_create_depth(0, 0, 0, obj_chat);
		_chat.strin = _pos;
	});
	
	rpc.registerHandler("PVP Update Spawners", function(_spawner){
		if(instance_exists(obj_pvp_powerup_spawner)){
			for(var q = 0; q < instance_number(obj_pvp_powerup_spawner);q++){
				var _pvp = instance_find(obj_pvp_powerup_spawner,q);
				_pvp.spawn = true;
			}
		}
	})
	
	rpc.registerHandler("spawn_shot", function(_pos) {
		if(_pos[4] == global.player_server_id) return;
		var _p = instance_create_depth(_pos[1], _pos[2], 0, _pos[0]);
		_p.dir = _pos[3];
		_p.image_xscale = _p.dir;
		_p.owner = _p;
		_p.shot_angle = _pos[4];
		_p.dmg = 0;
		_p.hurt_players = global.pvp;
		_p.destroy_when_off_screen = false;
	});
	
	rpc.registerHandler("spawn_enemy", function(_pos) {
		if(instance_position(_pos[1],_pos[2],_pos[0])) { return; }
		var _e = instance_create_layer(_pos[1],_pos[2],_pos[3],_pos[0]);
		_e.dies_when_offscreen = false;
		_e.network_id = _pos[4]
		global.server_enemies[_pos[4]] = _e;
	});
	
	rpc.registerHandler("rollback_spawn_player", function(_pos) {
		global.player_Server_update = false;
		var _p = instance_create_depth(global.player_x, global.player_y, 0, obj_player_online);
		with(obj_player_online){
			player_start();
		}
		players[_pos] = _p;
	});
	
	rpc.registerHandler("rollback_keys", function(_info){
		players[_info[0]].x =            _info[1];
		players[_info[0]].y =            _info[2];
		players[_info[0]].key_left =     _info[3];
		players[_info[0]].key_right =    _info[4];
		players[_info[0]].key_up =       _info[5];
		players[_info[0]].key_down =     _info[6];
		players[_info[0]].key_dash =     _info[7];
		players[_info[0]].key_jump =     _info[8];
		players[_info[0]].key_shoot =    _info[9];
		players[_info[0]].key_shoot2 =   _info[10];
		players[_info[0]].key_special =  _info[11];
		players[_info[0]].key_special2 = _info[12];
		players[_info[0]].key_wp1 =      _info[13];
		players[_info[0]].key_wp2 =      _info[14];
		players[_info[0]].state =        _info[15];
	});
	
	rpc.registerHandler("hurt_enemy", function(_pos) {
		//if(_pos[2] == global.player_server_id){ return;}
		log(string(array_length(global.server_enemies)) + " length of enemies")
		for(var q = 0; q < array_length(global.server_enemies); q++){
			log(string(global.server_enemies[q].network_id) + " id")
			log(string(_pos[0]) + " pos")
			if(global.server_enemies[q].network_id == _pos[0]){
				scr_weapon_apply_damage(global.server_enemies[q], _pos[1]);
			}
		}
	});
	
	rpc.registerHandler("update_all", function(_pos) {
		array_set(global.player_xs,        _pos[0], _pos[1]);
		array_set(global.player_ys,        _pos[0], _pos[2]);
		array_set(global.player_sprites,   _pos[0], _pos[3]);
		array_set(global.player_frames,    _pos[0], _pos[4]);
		array_set(global.player_dirs,      _pos[0], _pos[5]);
		array_set(global.player_chars,     _pos[0], _pos[6]);
		array_set(global.player_names,     _pos[0], _pos[7]);
		array_set(global.player_palettes,  _pos[0], _pos[8]);
		array_set(global.player_x_vel,     _pos[0], _pos[9]);
		array_set(global.player_y_vel,     _pos[0], _pos[10]);
		array_set(global.player_grav,      _pos[0], _pos[11]);
		array_set(global.server_enemies,   _pos[0], _pos[12]);
		array_set(global.player_key_rights,_pos[0], _pos[13]);
		array_set(global.player_key_lefts, _pos[0], _pos[14]);
		array_set(global.player_key_downs, _pos[0], _pos[15]);
		array_set(global.player_x_prevs,   _pos[0], global.player_xs[_pos[0]]);
	});
	
	rpc.registerHandler("update_player_id", function(_pos) {
		global.player_server_id = _pos[0];
		global.pvp = _pos[1];
	});
	
	rpc.registerHandler("change_room", function(_pos) {
		if(room != _pos[0])
			room_goto(_pos[0]);
	});
	
	is_connected = false;
	
	setEvent("connected", function() {
		is_connected = true;
		global.is_online = true;
		global.client = self;
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
		if(tick_timer > 60 / tick_rate && instance_exists(obj_player_parent)){
			var _p =  instance_nearest(0,0,obj_player_parent);
			var _x = instance_nearest(0,0,obj_player_parent).x;
			var _y = instance_nearest(0,0,obj_player_parent).y;
			_x = floor(_x);
			_y = floor(_y);
			
			//actual rollback. sends keys and predicts they will keep pressing keys
			if(global.rollback){
				rpc.sendNotification("rollback_keys", [
				global.player_server_id,
				_x,
				_y,
				_p.key_left,
				_p.key_right,
				_p.key_up,
				_p.key_down,
				_p.key_dash,
				_p.key_jump,
				_p.key_shoot,
				_p.key_shoot2,
				_p.key_special,
				_p.key_special2,
				_p.key_wp1,
				_p.key_wp2,
				_p.state
				]);
			} else {
				//delay based. this one actually fucking works
				var _spr = _p.pl_sprite;
				var _frm = global.player_sprite_index;
				var _dir = _p.image_xscale * _p.dir * (_p.state == states.wall_slide && _frm > 0 ? -1 : 1);
				var _plt = global.player_palette_index;
				var _mvx = _p.walk_speed;
				var _st = _p.state;
				if(variable_instance_exists(_p,"move")){
				_mvx = (_st!=states.wall_slide && _st!=states.crouch && _st!=states.wall_jump &&
				_st!=states.idle ? 
				_p.move*_p.walk_speed * (2/3) : 0)
				}
				rpc.sendNotification("update_all", 
				[_x,_y,_spr,_frm,_dir,_plt,
				_mvx
				,_p.v_speed,
				(_p.state != states.fall && _p.state != states.jump ? _p.grav * 0.5 : 0),
				_p.key_right,
				_p.key_left,
				_p.key_down
				]);
			}
			tick_timer = 0;
		} else {
			tick_timer++;
		}
	});
	
	start();
}