if(other.id == par_enemy_projectile)
	return;
other.using_world_speed = false;
other.local_game_speed = 0;

var _mx = 3;

while(other.hp > 2 && _mx > 0){
	other.hp --;
	_mx--;
}