if !surface_exists(surf) {
    surf = surface_create(16,16)
}
surface_set_target(surf)
gpu_set_colorwriteenable(false,false,false,true);

draw_clear_alpha(0,0)
draw_sprite(spr_super_arm_block_shards,1,0,0)

gpu_set_colorwriteenable(true,true,true,true);
gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);

draw_sprite_ext(spr_lab_block,1,0,0,1,1,0,c_white,1)

gpu_set_blendmode(bm_normal);
surface_reset_target()

draw_surface(surf,x,y)