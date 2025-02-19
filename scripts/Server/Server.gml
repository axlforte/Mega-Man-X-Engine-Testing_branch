function Server(_type, _port, _max_clients) constructor {
	self.socket = -1;
	self.type = _type;
	self.port = _port;
	self.maxClients = _max_clients;
	self.sockets = [];
	self.clients = new Manager();
	self.serverInstance = undefined;
	self.network = new Network();
	self.network.setType(_type);
	self.rpc = new RPC();
	self.rpc.setNetwork(network);
	self.nextClientId = 0;
	self.idToSocket = {};
	self.socketToId = {};
	self.events = {};
	self.object = obj_server;
	static addLocalClient = function(_client) {
		network.setLocalSocket(_client);
	}
	static createServerInstance = function() {
		serverInstance = instance_create_depth(0, 0, 0, object);
		serverInstance.server = self;
	}
	self.createServer = function() {
		return network_create_server(type, port, maxClients);
	}
	self.createClient = function(_id, _socket) {
		return new BaseClient(_id, _socket);
	}
	static enableConnectionMode = function() {}
	static addClientBySocket = function(_socket) {
		if (variable_struct_exists(self.socketToId, _socket)) return;
		var _client = createClient(self.nextClientId, _socket);
		clients.setElement(self.nextClientId, _client);
		array_push(sockets, self.nextClientId);
		self.idToSocket[$ self.nextClientId] = _socket;
		self.socketToId[$ _socket] = self.nextClientId;
		triggerEvent("connected", _client);
		self.nextClientId++;
	}
	static hasClientSocket = function(_socket) {
		var _id = self.socketToId[$ _socket];
		if (is_undefined(_id)) return false;
		return clients.hasElement(_id);	
	}
	static hasClient = function(_id) {
		return clients.hasElement(_id);	
	}
	static getClientBySocket = function(_socket) {
		var _id = self.socketToId[$ _socket];
		return clients.getElement(_id);	
	}
	static getClient = function(_id) {
		return clients.getElement(_id);	
	}
	static removeClientBySocket = function(_socket) {
		var _id = self.socketToId[$ _socket];
		removeClient(_id);
	}
	static removeClient = function(_id) {
		if (is_undefined(_id)) return;
		if (!clients.hasElement(_id)) return;
		var _client = clients.getElement(_id);
		triggerEvent("disconnected", _client);
		clients.removeElement(_id);
		var _socket = self.idToSocket[$ _id];
		struct_remove(self.idToSocket, _id);
		struct_remove(self.socketToId, _socket);
		var _index = array_get_index(sockets, _socket);
		if (_index == -1) return;
		array_delete(sockets, _index, 1);
	}
	static destroy = function() {
		network_destroy(socket);
		instance_destroy(serverInstance);
		clients.clearAll();
		sockets = [];
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
		socket = createServer();
		network.setDefaultSocket(socket);
		createServerInstance();
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
		var _client = getClientBySocket(_msg.socket);
		self.rpc.handleMessageFromClient(_msg.data, _client);
	});
}
function ServerRAW(_type, _port, _max_clients) : Server(_type, _port, _max_clients) constructor {
	self.network.setRAW(true);
	createServer = function() {
		return network_create_server_raw(type, port, maxClients);
	}
}