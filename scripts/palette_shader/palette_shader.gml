function palette_shader() {
	if (global.support_shaders && plt_texture != noone && plt_texture_sprite != noone) {
		shader_set(shdr_palette_swap);

		texture_set_stage(plt_swap_sampler, plt_texture);
		
		//show_debug_message(plt_texture_sprite)
		
		plt_height = sprite_get_height(plt_texture_sprite);
		plt_width = sprite_get_width(plt_texture_sprite);
		
		if(plt_height < plt_width)
			plt_height = plt_width;

		shader_set_uniform_f(v_offset, plt_index / plt_height);
		shader_set_uniform_f(v_source_offset, plt_source_index / plt_height);
		shader_set_uniform_f(v_height, plt_height);
	}


}
