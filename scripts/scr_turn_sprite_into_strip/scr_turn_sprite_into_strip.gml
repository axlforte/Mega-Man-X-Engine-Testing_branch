// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_turn_sprite_into_strip(){
	convert_sprite_sheet_to_sprite_animation(argument[0]);
}
function convert_sprite_sheet_to_sprite_animation(){
	//gets ready to set up the table of skins
	my_custom_sprites = ds_list_create();
	
	custom_sprites_lookup = ds_list_create();
	//these point out where each frame of animation is. because the sheet extends verically and
	//horizontally, i have 2 indexes for the position (x and y)
	ds_list_insert(custom_sprites_lookup,0,         [[0,6], [1,6], [2,6], [3,6], [4,6], [5,6]]);
	ds_list_insert(custom_sprites_lookup,1,         [[0,5], [1,5], [2,5], [3,5], [4,5], [5,5], [6,5]]);
	ds_list_insert(custom_sprites_lookup,2,         [[0,4], [1,4], [2,4], [3,4], [4,4], [5,4], [6,4]]);
	ds_list_insert(custom_sprites_lookup,3,         [[0,0], [1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0], [8,0], [9,0], [10,0]]);
	ds_list_insert(custom_sprites_lookup,4,         [[0,1], [1,1], [2,1], [3,1], [4,1], [5,1], [6,1], [7,1], [8,1], [9,1], [10,1]]);
	ds_list_insert(custom_sprites_lookup,5,         [[0,7], [1,7], [2,7], [3,7], [4,7], [5,7], [6,7], [7,7], [8,7], [9,7]]);
	ds_list_insert(custom_sprites_lookup,6,         [[0,8], [1,8], [2,8], [3,8], [4,8], [5,8], [6,8], [7,8], [8,8], [9,8], [10,8], [10,7]]);
	ds_list_insert(custom_sprites_lookup,7,         [[2,2], [3,2]]);
	ds_list_insert(custom_sprites_lookup,8,         [[6,6], [7,6]]);
	ds_list_insert(custom_sprites_lookup,9,         [[9,2], [10,2]]);
	ds_list_insert(custom_sprites_lookup,10,        [[10,3]]);
	ds_list_insert(custom_sprites_lookup,11,        [[7,4], [8,4]]);
	ds_list_insert(custom_sprites_lookup,12,        [[9,4], [10,4]]);
	ds_list_insert(custom_sprites_lookup,13,        [[0,2], [1,2]]);
	ds_list_insert(custom_sprites_lookup,14,        [[5,3], [6,3], [7,3], [8,3], [9,3]]);
	ds_list_insert(custom_sprites_lookup,15,        [[0,3], [1,3], [2,3], [3,3], [4,3]]);
	ds_list_insert(custom_sprites_lookup,16,        [[4,2], [5,2], [6,2], [7,2], [8,2]]);
	ds_list_insert(custom_sprites_lookup,17,        [[7,5], [8,5], [9,5], [10,5], [0,8]]);
	//here is where you get the animation file. 
	spr_x_sheet = sprite_add("Sprites/sheet_x.png", 1, false, false, 0, 0);
	if(spr_x_sheet == undefined){
		//if the sheet wasnt found, then the rest of the code wont work. breaktime!
		return;
	}
	//surf is where the animation is drawn to. width must match height, or you
	//cant draw properly.
	var surf = surface_create(70 * 6, 70 * 6);
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	var _xoff = 0;
	var _yoff = 0;
	//i need to add a wrapping for loop, it goes thru all the animations
	for(var e = 0; e < ds_list_size(custom_sprites_lookup); e++){
		//for each frame of the animation, draw the frame to surf.
		for (var i = 0; i < array_length(ds_list_find_value(custom_sprites_lookup,e)); i += 1){
			//the offsets are multiplied by 70 because the sprites are 70 pixels by 70 pixels.
			//you could have seperate sprite_height and sprite_width parameters when bringing in
			//animations.
			_xoff = ds_list_find_value(custom_sprites_lookup,e)[i][0] * 70;
			_yoff = ds_list_find_value(custom_sprites_lookup,e)[i][1] * 70;
			//draws the animation. the first 2 '70' values are sample width and height, and the 
			// i * 70 is the horizontal offset. the i value should be multiplied by the sample width
			draw_sprite_part(spr_x_sheet, 0, floor(_xoff), floor(_yoff), 70, 70, floor(i * 70), 0);
		}
		//this creates the first frame of the animation, and sets the offsets of the sprite to 32 and 40
		var _tmp_img = sprite_create_from_surface(surf, 0, 0, 70, 70, false, false, 32,40)
		
		for (var j = 1; j < array_length(ds_list_find_value(custom_sprites_lookup,e));j += 1)
		{
			//this adds the following parts of the sprite as new frames for the sprite. 
			//the leftmost false argument is to make the lower left pixel the transparency pixel,
			//which could be useful if people need guideboxes or a sheet background
			//the last argument is for having interpolation. this fucks up palettes, so leave it off
			sprite_add_from_surface(_tmp_img, surf, floor(j * 70 + 1), 0, 70, 70, false, false);
		}
		//adds the animation to the bucket of custom sprites. 
		ds_list_add(my_custom_sprites,_tmp_img);
		//clears surf completely, so the next sprite can be set up. 
		surface_reset_target();
		surface_free(surf);
		
		//if this isnt the end of the list, then set surf up and do this again
		if(e + 1 < ds_list_size(custom_sprites_lookup)){
			surf = surface_create( 70 * array_length(ds_list_find_value(custom_sprites_lookup,e + 1)), 70 * array_length(ds_list_find_value(custom_sprites_lookup,e + 1)));
			surface_set_target(surf);
		}
	}
}

function get_sprite_sheet_location(){
	
	switch(argument[0]){
	case("spr_x_idle"): return 0;
	case("spr_x_jump"): return 1;
	case("spr_x_jump_shoot"): return 2;
	case("spr_x_walk"): return 3;
	case("spr_x_walk_shoot"): return 4;
	case("spr_x_dolor"): return 5;
	case("spr_x_intro2"): return 6;
	case("spr_x_crouch"): return 7;
	case("spr_x_intro2_end"): return 8;
	case("spr_x_shoot"): return 9;
	case("spr_x_complete"): return 10;
	case("spr_x_dash"): return 11;
	case("spr_x_dash_shoot"): return 12;
	case("spr_x_crouch_shoot"): return 13;
	case("spr_x_ride_armor"): return 14;
	case("spr_x_wall"): return 15;
	case("spr_x_wall_shoot"): return 16;
	case("spr_x_outro"): return 17;
	default: return -1;
	}
}

function player_get_custom_sprites(){
	//log(pgcs_real(argument[0]));
	var _spr_tmp = ds_list_find_value(my_custom_sprites, get_sprite_sheet_location(argument[0]))
	//log(string(argument[0]) + " is the sprite i wanna customize")
	if(_spr_tmp == undefined)
		return noone;
	else
		return _spr_tmp;
}

function pgcs_real(){
	if(argument[0] == -1)
		return undefined;
	return ds_list_find_value(custom_sprites_lookup, get_sprite_sheet_location(argument[0]))
}