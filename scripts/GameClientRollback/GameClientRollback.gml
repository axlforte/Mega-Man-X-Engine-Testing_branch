function GameClientRollback(_ip, _port) : UDPSocket(_ip, _port) constructor {
	network.setReliable(true);
	enableConnectionMode();
	game_set_speed(60, gamespeed_fps);
	ping = 0;
	started = false;
	pubsub = new PubSub();
	netSync = new NetworkSync(pubsub);
	playerID = -1;
	maxDelay = 1;
	global.game = new RollbackGame();
	setEvent("error", function(err) {
		show_debug_message(err);
	});
	global.game.sendInput = function(_frame, _input) {
		rpc.sendNotification("player_input", {
			frame: _frame,
			input: global.game.inputs.toBinary(_input)
		});
	}
	pubsub.createTopic("start_game").subscribe(0, function(_id, _message) {
		players = _message.players;
		totalPlayers = array_length(players);
		global.game.setTotalPlayers(totalPlayers);
		change_room(rm_game, function() {
			for (var i = 0; i < totalPlayers; i++) {
				var _inst = global.game.instances.create(24 + i * 32, 100, obj_player_lockstep);
				_inst.init(players[i].id);
			}
			global.game.start();
		});
	});
	pubsub.createTopic("player_input").subscribe(0, function(_id, _message) {
		if (!started) return;
		var _player_id = _message.id;
		var _frame = _message.frame;
		var _input = global.game.inputs.fromBinary(_message.input);
		global.game.addInput(_frame, _player_id, _input);
	});
	
	rpc.registerHandler("room_send", function(_params) {
		netSync.processData(_params);
	});
	
	sendPing = function() {
		// Wait 1 second to send ping
		call = call_later(1, time_source_units_seconds, function() {
			rpc.sendRequest("ping", current_time)
				.onCallback(function(_result) {
					var _ping = current_time - _result;
					ping = _ping;
				})
				.onError(function(_error) {
					show_debug_message($"Error {_error.code}: {_error.message}");	
				})
				.onFinally(function() {
					sendPing();
				});
		});
	}
	setEvent("connected", function() {
		connected = true;
		sendPing();
		rpc.sendRequest("room_join", 1)
			.onCallback(function(_result) {
				started = true;
				playerID = _result.id;
				global.game.playerIndex = playerID;
			})
			.onError(function(_error) {
				show_debug_message(_error.message);	
			});
	});
	setEvent("step", function() {
		if (!connected) return;
		if (keyboard_check_pressed(vk_enter)) {		
			rpc.sendNotification("start_game");
		}
		global.game.step();
	});
	start();
}