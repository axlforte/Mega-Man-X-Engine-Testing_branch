palette_init();
chatting = false;
chat_string = "";
palette_texture_set(plt_x_full);
if(instance_exists(obj_player_parent))
	depth = instance_nearest(0,0,obj_player_parent).depth;