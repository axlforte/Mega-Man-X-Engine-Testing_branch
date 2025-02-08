with(obj_locked_door){
	if(key_id == other.key_id){
		instance_destroy();
	}
}
instance_destroy();