// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mask_set(){
	if (global.support_shaders && mask_sprite != noone) {
		texture_set_stage(plt_swap_sampler, mask_sprite);
		texture_set_stage(plt_swap_sampler, original_sprite);
	}
}