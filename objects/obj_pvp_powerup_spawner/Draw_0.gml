draw_sprite(spr_x_charging_orbs,spawn_timer / 4,x,y);
if(spawn_timer > spawn_timer_limit / 2){
	draw_sprite(spr_x_charging_glow,spawn_timer / 4,x,y);
}
if(spawn_timer > (spawn_timer_limit / 4) * 3){
	draw_sprite(spr_death_orb_zero,spawn_timer / 4,x,y);
}