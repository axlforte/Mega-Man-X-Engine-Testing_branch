//you dont need to draw anything tho
if(state_timer < time_slow_duration / 1.25 || state_timer mod 2 == 0){
draw_sprite_ext(spr_time_slow_small_hand, state_timer / 4, x, y, 1, 1, 
(state_timer / time_slow_duration)*360 + 90, c_white, 0.8);
draw_sprite_ext(spr_time_slow, state_timer / 4, x, y, 1, 1, 
(state_timer / 60)*360+- 90, c_white, 0.5);
}