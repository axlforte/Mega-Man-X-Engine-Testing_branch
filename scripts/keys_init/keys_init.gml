function keys_init() {
	enum e_key
	{
		up,
		down,
		left,
		right,
		dash,
		jump,
		shoot,
		shoot2,
		special,
		special2,
		weapon1,
		weapon2,
		start,
		select
	}
	// Key Name
	global.key_text[e_key.up]      = "UP";
	global.key_text[e_key.down]    = "DOWN";
	global.key_text[e_key.left]    = "LEFT";
	global.key_text[e_key.right]   = "RIGHT";
	global.key_text[e_key.dash]    = "DASH";
	global.key_text[e_key.jump]    = "JUMP";
	global.key_text[e_key.shoot]   = "SHOOT";
	global.key_text[e_key.shoot2]  = "SHOOT2";
	global.key_text[e_key.special] = "SPECIAL";
	global.key_text[e_key.special2] = "SPECIAL2";
	global.key_text[e_key.weapon1] = "WEAPON1";
	global.key_text[e_key.weapon2] = "WEAPON2";
	global.key_text[e_key.start]   = "MENU";
	global.key_text[e_key.select]  = "RETURN";
	// Keyboard
	global.key_config[e_key.up]      = vk_up;
	global.key_config[e_key.down]    = vk_down;
	global.key_config[e_key.left]    = vk_left;
	global.key_config[e_key.right]   = vk_right;
	global.key_config[e_key.dash]    = ord("D");
	global.key_config[e_key.jump]    = ord("V");
	global.key_config[e_key.shoot]   = ord("X");
	global.key_config[e_key.shoot2]  = ord("C");
	global.key_config[e_key.special] = ord("Z");
	global.key_config[e_key.special2] = ord("F");
	global.key_config[e_key.weapon1] = ord("A");
	global.key_config[e_key.weapon2] = ord("S");
	global.key_config[e_key.start]   = vk_enter;
	global.key_config[e_key.select]   = vk_escape;
	// Gamepad
	global.gamepad_config[e_key.up]      = gp_padu;//dpad up
	global.gamepad_config[e_key.down]    = gp_padd;//dpad down
	global.gamepad_config[e_key.left]    = gp_padl;//dpad left
	global.gamepad_config[e_key.right]   = gp_padr;//dpad right
	global.gamepad_config[e_key.dash]    = gp_face2;//b
	global.gamepad_config[e_key.jump]    = gp_face1;//a
	global.gamepad_config[e_key.shoot]   = gp_face3;//x
	global.gamepad_config[e_key.shoot2]  = gp_face4;//y
	global.gamepad_config[e_key.special] = gp_shoulderl;//right bumper
	global.gamepad_config[e_key.special2] = gp_shoulderr;//right trigger
	global.gamepad_config[e_key.weapon1] = gp_shoulderrb;//left bumper
	global.gamepad_config[e_key.weapon2] = gp_shoulderlb;//left trigger
	global.gamepad_config[e_key.start]   = gp_start; //the 3 lines
	global.gamepad_config[e_key.select]   = gp_select; // the window button

	// Initialize Variables using Apply
	keys_apply();

	// Use this to reset the keys
	global.key_config_default     = global.key_config;
	global.gamepad_config_default = global.gamepad_config;


}
