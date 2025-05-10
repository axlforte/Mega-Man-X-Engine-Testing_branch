function GameClient(_ip, _port) : TCPSocket(_ip, _port) constructor {
	ping = 0;
	nickname = "";
	shot_index = 0;
	players = [];
	shots = array_create(32,[]);
	client_chat = new ClientChatRPC();
	tick_rate = global.tick_rate;
	tick_timer = 0;
	is_connected = false;
	last_created_shot = noone;
	
	ClientFunctions();
	
	CSD = new ClientShotData();
	CPD = new ClientPlayerData();
	CVD = new ClientVariousData();
	
	setEvent("connected", function() {
		ClientConnect();
	});
	
	setEvent("step", function() {
		ClientStep();
	});
	
	start();
}
function ClientConnect(){
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
	settings_load();
	settings_apply();
	log(global.username + " is the current username.")
	var _nick = get_string("Username", global.username);
	global.username = _nick;
		log(global.username + " is the new current username.")
	nickname = _nick;
	settings_save();
	sendPing();
	rpc.sendNotification("room_join");
	rpc.sendNotification("set_nickname", _nick);
	rpc.sendNotification("update_player_char", _chr);
}
function ClientStep(){
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
			var _mvx = 0;
			var _st = _p.state;
			if(variable_instance_exists(_p,"move")){
				_mvx = _p.move*_p.walk_speed * (2/3);
					
				var _mv_except = [
					states.idle,
					states.crouch,
					states.intro,
					states.complete,
					states.wall_slide,
					states.dolor,
					states.death,
					states.dead
				]
					
				for(var e = 0; e < alength(_mv_except); e++){
					if(_st == _mv_except[e])
						_mvx = 0;
				}
			}
			rpc.sendNotification("update_all", 
			[_x,_y,_spr,_frm,_dir,_plt,
			_mvx
			,_p.v_speed,
			(_p.state != states.fall && _p.state != states.jump ? _p.grav / 3 : 0),
			_p.key_right,
			_p.key_left,
			_p.key_down,
			_p.animation_frames,
			_p.animation_loop,
			_p.animation_i
			]);
		}
		tick_timer = 0;
	}
		tick_timer++;
}
function ClientFunctions(){
	sendPing = function() {
        // Wait 1 second to send ping
        call_later(1, time_source_units_seconds, function() {
            rpc.sendRequest("ping", current_time)
                .onCallback(function(_result) {
                    var _ping = current_time - _result;
					global.ping = _ping;
                })
                .onError(function(_error) { 
					global.server = false;
					audio_stop_all();
					audio_group_set_gain(audiogroup_default, 1, 0);
					global.player_lives = max(global.player_lives, 2);
					room_goto(rm_start_menu);
					global.start_menu_force_state = true;
					global.start_menu_state = menu_states.main;
					global.checkpoint = false;
                })
                .onFinally(function() {
                    sendPing();
                });
        });
    }
	
	createProjectile = function(_shot) {
		
		if(object_get_name(_shot.object_index) == "obj_pvp_projectile") return;
		
		//var _my_tags = asset_get_tags(object_get_name(_shot.object_index));
		//if(array_contains(_my_tags, "nopvp")) return;
		
		var _server_shot_id = 0;
		var _fail = false;
		if(array_length(shots) > global.player_server_id){
			if(array_length(shots[global.player_server_id]) > 0){
				_server_shot_id = shot_index++;
				array_push(shots[global.player_server_id],_shot);
			} else 
				_fail = true;
		} else 
			_fail = true;
			
		if(_fail){
			shots[global.player_server_id] = _shot;
		}
		
		var _dir = 1;
		if(variable_instance_exists(_shot,"dir"))
			_dir = _shot.dir;
		var _atk = _shot.atk;
		if(object_get_name(_shot.object_index) == "obj_player_effect_parent"){_atk = -1;}
		
		rpc.sendNotification("create projectile", 
		[_shot.sprite_index,_shot.image_index,_shot.x,_shot.y,
		_shot.v_speed,_shot.h_speed, _server_shot_id,global.player_server_id, 0, _dir, _atk]);
		return _server_shot_id;
    }
	
	pingProjectile = function(_shot) {
		if(object_get_name(_shot.object_index) == "obj_pvp_projectile"){return;}
		var _atk = _shot.atk;
		if(object_get_name(_shot.object_index) == "obj_player_effect_parent"){_atk = -1;}
		//log("update dammit")
		
		var _dir = 1;
		if(variable_instance_exists(_shot,"dir"))
			_dir = _shot.dir;
		rpc.sendNotification("update projectile", 
		[_shot.sprite_index,_shot.image_index,_shot.x,_shot.y,
		_shot.v_speed,_shot.h_speed, _shot.server_shot_id,global.player_server_id, 0, _dir,_atk]);
    }
	
	KillProjectile = function(_shot){
		if(object_get_name(_shot.object_index) == "obj_pvp_projectile") return;
		log(string(_shot.server_shot_id) + " is the shot id. it wants to die!")
		rpc.sendNotification("kill projectile", _shot);
	}
}
function ClientPlayerData() constructor{
	client = other;
	
	client.rpc.registerHandler("update_all", function(_pos) {
		array_set(global.player_xs,               _pos[0], _pos[1]);
		array_set(global.player_ys,               _pos[0], _pos[2]);
		array_set(global.player_sprites,          _pos[0], _pos[3]);
		array_set(global.player_frames,           _pos[0], _pos[4]);
		array_set(global.player_dirs,             _pos[0], _pos[5]);
		array_set(global.player_chars,            _pos[0], _pos[6]);
		array_set(global.player_names,            _pos[0], _pos[7]);
		array_set(global.player_palettes,         _pos[0], _pos[8]);
		array_set(global.player_x_vel,            _pos[0], _pos[9]);
		array_set(global.player_y_vel,            _pos[0], _pos[10]);
		array_set(global.player_grav,             _pos[0], _pos[11]);
		array_set(global.server_enemies,          _pos[0], _pos[12]);
		array_set(global.player_key_rights,       _pos[0], _pos[13]);
		array_set(global.player_key_lefts,        _pos[0], _pos[14]);
		array_set(global.player_key_downs,        _pos[0], _pos[15]);
		array_set(global.player_animation_frames, _pos[0], _pos[16]);
		array_set(global.player_animation_loops,  _pos[0], _pos[17]);
		array_set(global.player_frame_counts,     _pos[0], _pos[18]);
		array_set(global.player_x_prevs,          _pos[0], global.player_xs[_pos[0]]);
	});
	
	client.rpc.registerHandler("update_player_id", function(_pos) {
		global.player_server_id = _pos[0];
		global.pvp = _pos[1];
	});
	
	client.rpc.registerHandler("rollback_spawn_player", function(_pos) {
		global.player_Server_update = false;
		var _p = instance_create_depth(global.player_x, global.player_y, 0, obj_player_online);
		with(obj_player_online){
			player_start();
		}
		players[_pos] = _p;
	});
	
	client.rpc.registerHandler("rollback_keys", function(_info){
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
	
	client.rpc.registerHandler("haul_ass", function(_pos) {
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
		client.rpc.sendNotification("set_nickname", _nick);
		client.rpc.sendNotification("update_player_id", _nick);
	});
}
function ClientShotData() constructor{
	client = other;
	
	client.rpc.registerHandler("create projectile", function(_pos) {
		//log("google " + string(_pos[7]));
		if(_pos[7] == global.player_server_id){return;}
		
		
		
		var _proj = instance_create_depth(_pos[2],_pos[3],0,obj_pvp_projectile);
		_proj.sprite_index = _pos[0];
		_proj.image_index = _pos[1];
		_proj.x = _pos[2];
		_proj.y = _pos[3];
		_proj.v_speed = _pos[4];
		_proj.h_speed = _pos[5];
		_proj.server_shot_id = _pos[6];
		_proj.client_shot_id = _pos[7];
		if(variable_instance_exists(_proj,"dir")){
			_proj.dir = _pos[9];
		}
		array_push(shots[_pos[7]], _proj);
		
		if(_pos[7] == global.player_server_id)global.client.shots[_pos[7]][_pos[6]] = -1;
	});
	
	client.rpc.registerHandler("update projectile", function(_shots){
		global.client.shots = _shots;
	});
	
	client.rpc.registerHandler("kill projectile", function(_proj){
		//log("literally anything");
		global.client.shots[_proj[7]][_proj[6]] = -1;
		log(global.client.shots)
		//log("didnt find it");
	});
}
function ClientVariousData() constructor{
	client = other;
	
	client.rpc.registerHandler("PVP Update Spawners", function(_spawner){
		if(instance_exists(obj_pvp_powerup_spawner)){
			for(var q = 0; q < instance_number(obj_pvp_powerup_spawner);q++){
				var _pvp = instance_find(obj_pvp_powerup_spawner,q);
				_pvp.spawn = true;
			}
		}
	});
	
	client.rpc.registerHandler("change_room", function(_pos) {
		if(room != _pos[0])
			room_goto(_pos[0]);
	});
}