event_inherited();
idle_time_to_turn = 5;
jump_wait = 5;
dash_speed = 4;
#region Animations
animation_add("idle", [
	0, 0
], 0);

animation_add("fall", [
	0, 3
]);
animation_add("land", [
	0, 3,
	1,1,
	2,0
]);
animation_add("intro",
[
	0, 11,
	10, 2
], 12);
animation_add("death", [
	0, 34
], 0);
animation_add("death_chop", [
	0, 34,
	5, 35,
	9, 36,
	14, 37,
	18, 38,
	22, 39
], 30);

animation_add("swing_floor",[
 0, 5,
 30, 6, 
 32, 7, 
 34, 8
]);

animation_add("swing_wall",[
 0, 9,
 30, 10, 
 32, 11, 
 34, 12
]);

animation_add("swing_roof",[
 0, 13,
 30, 14, 
 32, 15, 
 34, 16
]);
#endregion
#region Difficulty
damage_set(3, 5, 7);
switch (global.difficulty) {
	case diff_modes.easy:
		idle_limit = 40;
		idle_desperate_limit = 30;
		dash_speed = 4;
		break;
	case diff_modes.normal:
		idle_limit = 20;
		idle_desperate_limit = 10;
		dash_speed = 5;
		break;
	case diff_modes.hard:
		idle_limit = 10;
		idle_desperate_limit = 5;
		hp_desperate = 32;
		dash_speed = 6;
		break;
}
#endregion
// Specific attacks
ds_list_clear(attacks_list);
// Attack Settings
attack_properties[? boss_states.jump] = [2, 0];
attack_properties[? boss_states.dash] = [2, 0];
attack_properties[? BLADE_MAN.DASH] = [1, 1/2];

ds_list_add(desperate_attacks, [BLADE_MAN.BIG_BLADE, [1, 1/2]]);
// Desperate attacks [state, chances]
face_x = false;
activate_collision_limit = 40;
state_set(boss_states.fall);
animation_play("fall");
grav = 0.25;
v_speed = 1;
jump_strength = 6.5;

for (var i = 0; i < instance_number(obj_blade_man_point); ++i;)
{
    jump_points[i] = instance_find(obj_blade_man_point,i);
}

jp_count = instance_number(obj_blade_man_point);

goal_point = noone;

pl_x = 0;
pl_y = 0;

hp_start_of_swing = 32;