// Needs refactoring and put all palette functions in one script called Palette
function mask_init() {
	// Offset uniform

	mask_sprite = spr_super_arm_block_shards;
	original_sprite = spr_lab_block;

	if (!global.support_shaders) exit;
	// Sampler and texture variables
	plt_swap_sampler = shader_get_sampler_index(shdr_palette_swap, "Palette");


}
