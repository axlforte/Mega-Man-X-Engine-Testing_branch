function Client(_id, _socket) : BaseClient(_id, _socket) constructor {
	self.name = "";
	self.room = -1;

	static setName = function(_name) {
		self.name = _name;	
	}
	static getName = function() {
		return self.name;	
	}
}