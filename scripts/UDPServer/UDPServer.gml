function UDPServer(_port) 
: Server(network_socket_udp, _port, 1000) constructor {
	self.object = obj_udp_server;
	self.connectionMode = false;
	static enableConnectionMode = function() {
		self.connectionMode = true;
		setEvent("message", function(_message) {
			var _socket = _message.socket;
			if (_message.data == "connect") {
				addClientBySocket(_socket);
				network.sendData("connected", _socket);
				return;
			}
			if (hasClientSocket(_socket)) {
				var _client = self.getClientBySocket(_socket);
				rpc.handleMessageFromClient(_message.data, _client);
			}
		});
	}
}
function UDPServerRAW(_port) 
: UDPServer(_port) constructor {
	self.network.setRAW(true);
	createServer = function() {
		return network_create_server_raw(type, port, maxClients);
	}
}
