x = global.player_x;
y = global.player_y;
draw_sprite_ext(spr_death_square_16, 0, 0, 0, 30, 30, 0, c_white, 
(state_timer < time_slow_duration/1.1 ? 0.4 : (state_timer mod 20) * 0.02));