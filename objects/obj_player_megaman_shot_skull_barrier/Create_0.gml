event_inherited();
sound = snd_megaman_shot_2;

abs_hspeed = 0;
atk = 2;
blocking = true;
angle = 45;
angle_rotation_speed = 5;
angle_dist = 0;
angle_dist_max = 28;
detached = false;
dir = 1;
power_gear_made_projectiles = false;
is_power_geared = instance_nearest(x,y,obj_player_parent).power_gear;

scr_keys_reset();

execute_step_in_first_frame = true;