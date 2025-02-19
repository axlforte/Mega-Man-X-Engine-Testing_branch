/// @description - Draw String on Screen
/// @param x
/// @param y
/// @param string
/// @param _color
function draw_string() {

	enum colors
	{
		blue,
		dark_blue,
		dark_green,
		orange,
		dark_orange,
		dark_orange_off,
		purple,
		pink,
		dark_purple,
		red,
		gray
	}

	// Arguments
	var _x = argument[0];
	var _y = argument[1];
	var _text = argument[2];
	var _color = (argument_count > 3 ? argument[3] : colors.blue);
	var _use_plt = (argument_count > 4 ? argument[4] : true);

	if(_use_plt){
		plt_index = _color;

		palette_texture_set(plt_text_font_normal);
		palette_shader();
	}

	var xx = _x - 2;
	for (var i = 1; i <= string_length(_text); i++) {
	    var _char = string_copy(_text, i, 1);
	
	    if (_char != " ") {
			draw_sprite_offset(global.text_font_sprite, char_index(_char), xx, _y - 1);
	    }
		xx += global.text_font_width;
	}
	if(_use_plt)
		palette_reset();


}
