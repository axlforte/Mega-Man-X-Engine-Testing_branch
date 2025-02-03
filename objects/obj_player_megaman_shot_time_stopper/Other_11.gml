var t = state_timer++;
x = __view_get(e__VW.XView, 0) + 160;
y = __view_get(e__VW.YView, 0) + 120;
// State Properties
grav = 0;
v_speed = 0;
speed_gear = instance_nearest(x,y,obj_player_parent).speed_gear;
// Pause everything except the player
if (t == 0) {
	with (obj_surface) {
		drawing_layers_on_surfaces = true;
		player_inst = instance_nearest(x,y,obj_player_parent);
		black_animation = 1;
	}
	draw_on_surface = true;
}
var surf_inst = obj_surface;
// Close Circle
var max_radius = global.view_width / 2;
if (t == 2) {
	surf_inst.black_radius = 0;
	surf_inst.black_animation = 3;
		global.game_world_speed = 0;
}
if (t > 2 && t <= 26) {//t <= 128
	if(t + 2 mod 8 == 0){
		surf_inst.black_radius = 0;
		
	}
	surf_inst.black_radius += max_radius / (128 - 120);	
}
	
if (t == 27) {
	surf_inst.drawing_layers_on_surfaces = false;
	surf_inst.black_animation = 0;
	surface_draw_set_objects([par_tile, obj_door, par_destructibleobject, par_enemy], false);
	tilemap_layer_set_visible(true);
	background_layer_set_visible(true);
	with(obj_player_parent){
	draw_on_surface = false;
	ignore_draw = false;
	visible = true;
	}
	
}

var p = instance_create_depth(x + irandom_range(-160, 160),y + irandom_range(-120, 120),depth, obj_player_megaman_shot_time_stopper_particles);
var p = instance_create_depth(x + irandom_range(-140, 140),y + irandom_range(-100, 100),depth, obj_player_megaman_shot_time_stopper_particles);
var p = instance_create_depth(x + irandom_range(-120, 120),y + irandom_range(-80, 80),depth, obj_player_megaman_shot_time_stopper_particles);

/*
10 seconds - fully drain
28 units
60 fps
*/

instance_nearest(x,y,obj_player_parent).weapon_energy[weapons.time_stopper]-=1 / 60 * 28 / 10;
if(instance_nearest(x,y,obj_player_parent).weapon_energy[weapons.time_stopper] < 0){
	global.game_world_speed = old_world_speed;
	instance_destroy();
}