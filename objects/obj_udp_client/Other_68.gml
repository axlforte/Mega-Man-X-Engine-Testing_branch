var _type = async_load[? "type"];
var _id = async_load[? "id"];
var _buffer = async_load[? "buffer"];
if (_id != client.socket) return;
if (_type != network_type_data) return;
try {
	client.network.processBuffer(_buffer, new ConnectedUDPSocket(client.ip, client.port));
} catch (_error) {
	client.triggerEvent("error", _error);
}