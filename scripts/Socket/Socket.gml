function Socket(_type, _ip, _port) constructor {
	self.connected = false;
	self.events = {};
	self.socket = -1;
	self.type = _type;
	self.ip = _ip;
	self.port = _port;
	self.clientInstance = undefined;
	self.rpc = new RPC();
	self.network = new Network();
	self.rpc.setNetwork(network);
	self.object = obj_client;
	self.connect = function() {
		network_connect_async(socket, ip, port);	
	}
	static setLocalServer = function(_server) {
		_server.addLocalClient(self);
		network.setLocalServer(_server);
	}
	static enableConnectionMode = function() {}
	static setType = function(_type) {
		type = _type;	
	}
	static setEvent = function(_event, _method) {
		events[$ _event] = _method;
	}
	static triggerEvent = function(_event, _params) {
		if (variable_struct_exists(events, _event)) {
			events[$ _event](_params);	
		}
	}
	static start = function() {
		socket = network_create_socket(type);
		network.setDefaultSocket(socket);
		network.setDefaultUDP(ip, port);
		network.setType(type);
		connect();
		clientInstance = instance_create_depth(0, 0, 0, object);
		clientInstance.client = self;
	}
	static destroy = function() {
		network_destroy(socket);
		instance_destroy(clientInstance);
	}
	network.onMessage = function(_buffer, _id) {
		var _json = network.readBufferText(_buffer);
		var _data = json_parse(_json);
		triggerEvent("message", {
			data: _data,
			socket: _id
		});	
	}
	setEvent("message", function(_msg) {
		self.rpc.handleMessageFromSocket(_msg.data, _msg.socket);
	});
}
function SocketRAW(_type, _ip, _port) : Socket(_type, _ip, _port) constructor {
	self.connect = function() {
		self.network.setRAW(true);
		network_connect_raw_async(socket, ip, port);	
	}
}
