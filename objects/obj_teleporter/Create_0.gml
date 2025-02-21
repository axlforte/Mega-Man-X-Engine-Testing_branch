tp_x = 0;
tp_y = 0;
cam_x = 0;
cam_y = 0;
camera_id = 0;
teleport = false;
t_timer = 0;
animation_init();
animations_init();
state_machine_init();
surface_draw_init();
animation_add("S", [
	0, 0
], 0);
animation_add("N", [
	0, 5
], 0);
// Open
animation_add("O", [
	0, 0,
	2, 1,
	4, 2,
	12, 3,
	14, 4,
	16, 5
], 17);
// Close
animation_add("C", [
	0, 5,
	2, 4,
	4, 3,
	12, 2,
	14, 1,
	16, 0
], 17);
trail_init(0);