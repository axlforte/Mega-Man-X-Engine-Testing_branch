function screen_update_stretched() {
	var base_w = global.view_width;
	var base_h = global.view_height;
	var ww = base_w, hh = base_h;

	// Stretched
	if (global.settings[0] == global.fullscreen_index) {
		base_w = display_get_width();
	    base_h = display_get_height();
	    var aspect = base_w / base_h ; // Get the game aspect ratio
	    hh = base_h;
	    ww = hh * aspect;
	}

	surface_resize(application_surface, ww, hh);


}
