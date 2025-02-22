var _ip = async_load[? "ip"];
var _port = async_load[? "port"];
var _type = async_load[? "type"];
var _id = async_load[? "id"];
var _buffer = async_load[? "buffer"];
if (_id != server.socket) return;
if (_type != network_type_data) return;
try {
	server.network.processBuffer(_buffer, new ConnectedUDPSocket(_ip, _port));
} catch (_error) {
	server.triggerEvent("error", _error);
}
