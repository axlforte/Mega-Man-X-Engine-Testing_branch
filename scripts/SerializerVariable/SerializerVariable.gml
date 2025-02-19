#macro GM_NETCODE_SERIALIZER_HASH_ENABLED false

function SerializerVariable(_owner, _name) constructor {
	self.owner = _owner;
	self.value = undefined;
	self.hash = (GM_NETCODE_SERIALIZER_HASH_ENABLED ? variable_get_hash(_name) : _name);
	static serialize = function() {
		if (GM_NETCODE_SERIALIZER_HASH_ENABLED) {
			return struct_get_from_hash(self.owner, self.hash);
		}
		return variable_struct_get(self.owner, self.hash);
	}
	static deserialize = function(_data) {
		if (GM_NETCODE_SERIALIZER_HASH_ENABLED) {
			struct_set_from_hash(self.owner, self.hash, _data);
			return;
		}
		variable_struct_set(self.owner, self.hash, _data);
	}
	static setValue = function(_value) {
		self.value = _value;	
	}
	static getValue = function() {
		return self.value;	
	}
}
function SerializerCustom(_owner, _name) : SerializerVariable(_owner, _name) constructor {
	static serialize = function() {
		var _value;
		if (GM_NETCODE_SERIALIZER_HASH_ENABLED) {
			_value = struct_get_from_hash(self.owner, self.hash);
		} else {
			_value = variable_struct_get(self.owner, self.hash);
		}
		return _value.serializer.serialize();
	}
	static deserialize = function(_data) {
		var _value;
		if (GM_NETCODE_SERIALIZER_HASH_ENABLED) {
			_value = struct_get_from_hash(self.owner, self.hash);
		} else {
			_value = variable_struct_get(self.owner, self.hash);
		}
		_value.serializer.deserialize(_data);
	}
}

function SerializerClone(_owner, _name) : SerializerVariable(_owner, _name) constructor {
	static serialize = function() {
		var _value = struct_get_from_hash(self.owner, self.hash);
		return variable_clone(_value);
	}
}