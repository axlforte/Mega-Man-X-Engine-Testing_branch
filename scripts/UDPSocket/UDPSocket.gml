function UDPSocket(_ip, _port) 
: Socket(network_socket_udp, _ip, _port) constructor {
	self.connectionMode = false;
	self.object = obj_udp_client;
	network.onMessage = function(_buffer, _id) {
		var _json = network.readBufferText(_buffer);
		var _data = json_parse(_json);
		triggerEvent("message", {
			data: _data
		});	
	}
	self.enableConnectionMode = function() {
		self.connectionMode = true;
		self.connect = function() {
			network.sendData("connect"); 
		}
		setEvent("message", function(_message) {
			if (_message.data == "connected") {
				self.triggerEvent("connected");	
				return;
			}
			self.rpc.handleMessageFromSocket(_message.data);
		});
	}
}

function UDPSocketRAW(_ip, _port) 
: UDPSocket(_ip, _port) constructor {
	self.network.setRAW(true);
}
