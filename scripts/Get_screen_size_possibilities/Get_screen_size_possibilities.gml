// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Get_screen_size_possibilities(){
	var wsize_options = [];
	var k = 0;
	while((k+1)*global.view_height + 40 <= global.screen_height) {
		wsize_options[k] = string(k+1) + "x Scale";
		k++;
	}
	wsize_options[k] = "FULLSCREEN";
	wsize_options[k + 1] = "STRETCHED";
	global.fullscreen_index = k + 1;
	// Mobile
	if (G.mobile) {
		wsize_options = ["NORMAL", "STRETCHED"];
		global.fullscreen_index = 1;
	}
	return wsize_options;
}