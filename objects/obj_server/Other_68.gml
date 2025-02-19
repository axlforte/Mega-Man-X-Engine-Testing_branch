var _socket = async_load[? "socket"];
var _type = async_load[? "type"];
var _id = async_load[? "id"];
// Handle connection and disconnection
if (_id == server.socket) {
	switch (_type) {
		case network_type_connect:
			server.addClientBySocket(_socket);
			break;
		
		case network_type_disconnect:
			server.removeClientBySocket(_socket);
			break;
	}
}
// Handle data packets using RPC
else if (_type == network_type_data && server.hasClientSocket(_id)) {
	var _buffer = async_load[? "buffer"];
	try {
		server.network.processBuffer(_buffer, _id);
	} catch (_error) {
		server.triggerEvent("error", _error);
	}
}


