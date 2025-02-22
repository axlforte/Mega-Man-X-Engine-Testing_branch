/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
<<<<<<< HEAD
	if(is_undefined(owner) || owner == noone)
		instance_destroy();
=======
>>>>>>> origin/master
	if (t < player_lock && initial_player_dir == owner.dir){ 
		if(owner.state == states.dolor){
			if (instance_exists(owner)) {
				with(owner){
					player_state_set(states.fall);
				}
				instance_destroy();
			}
		}
		with(owner){
			y = other.initial_player_y;
			move_x(other.player_horiz_speed * dir);
			v_speed = 0;
			h_speed = 0;
			animation_play("dash")
			locked = true;
		}
		initial_player_x += player_horiz_speed * owner.dir;
		x += player_horiz_speed * owner.dir;
		
	}else if (t == player_lock) instance_destroy();
}