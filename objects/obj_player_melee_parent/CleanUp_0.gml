animations_destroy();
ds_list_destroy(shots_group);
if(global.is_online && object_get_name(object_index) != "obj_pvp_projectile"){
	global.client.KillProjectile(self);
}