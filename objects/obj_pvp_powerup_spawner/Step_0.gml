if(spawn && powerup != noone){
	instance_create_depth(x,y,depth - 1,powerup);
	spawn_timer = 0;
	spawn = false;
}

if(spawn_timer >= spawn_timer_limit){
	spawn = true;
} else {
	spawn_timer++;	
}