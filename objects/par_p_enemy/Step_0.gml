//outside=v_outside(sprite_width/2,sprite_height/2);
outside = !is_inside_view();//whyyy you invert it anyways
if (!outside && p_outside)
{
    if (!instance_exists(created))
    {
		if(online && !is_undefined(CLI)){
			CLI.spawn_enemy(
			[enemy_name, 
			x,y,
			layer,
			array_length(global.server_enemies) + 1]);
			log("enemy created at id "+ string(array_length(global.server_enemies) + 1))
		} else {
		  created = instance_create_layer(x,y,layer,enemy_name);
        //set_global_message("Spawned "+object_get_name(enemy_name));
		}
    }
}
p_outside=outside;

