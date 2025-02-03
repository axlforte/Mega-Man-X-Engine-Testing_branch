event_inherited();
with(obj_player_parent){
	//player_disable_speed_gear();
	shots_count--;
	other.depth = depth + 1;
}
speed_gear = false;
destroy_if_hit = true;
// Destroy Animation
animation_add("D",
[
	0, 1,
	2, 2,
	4, 3,
	5, 3
]);
state_timer = -1;
old_world_speed = global.game_world_speed;
time_slow_duration = 1800;

// Blocked Animation
animation_add("B",
[
	0, 0
], 0, 0);

animation_play("B");
sound = snd_megaman_shot_1;
abs_hspeed = 0;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;