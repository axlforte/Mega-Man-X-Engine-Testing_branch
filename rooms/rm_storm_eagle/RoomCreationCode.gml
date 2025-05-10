/// @desc Execute Autosolid Script
var inst_lay = layer_get_id("inst0");				 // Layer for create solid instance
var tile_lay = layer_tilemap_get_id("tileset_layer_base");// The Tiles layer to get the index
scr_autotile_place_solid(inst_lay,tile_lay,16);          // Execute Autosolid Script
music_play("StormEagle");
background_list_set(1, [new BGInfo(storm_tornado_background,0.5)]);
room_shader_init();