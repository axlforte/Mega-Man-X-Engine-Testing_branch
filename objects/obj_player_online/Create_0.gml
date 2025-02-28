armor_check = 0;
player_start();
limit_x = [floor((bbox_right - bbox_left) / 2), room_width - floor((bbox_right - bbox_left) / 2)];
limit_y = floor((bbox_bottom - bbox_top) / 2);

armor_script = player_x_armor;
variables_script = player_x_variables;
weapon_offsets_script = player_x_weapon_offsets;
// Load Armor Properties
player_load_armor();

global.player_Server_update = true;