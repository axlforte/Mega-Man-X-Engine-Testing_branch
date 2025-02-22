PAUSE;
event_inherited();
brightness = clamp(brightness, 0, 4);
i_i += 1/2;
if (i_i >= brightness * 5 + 5|| !is_inside_view())
	instance_destroy();
else if(i_i < brightness * 5)
	i_i = brightness * 5;