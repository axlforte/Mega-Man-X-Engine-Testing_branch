projectile_collision_init();
does_comboing = false;

if(global.is_server){
	global.server.spawn_enemy_shot(x,y,object_index,v_speed,h_speed,grav);
}