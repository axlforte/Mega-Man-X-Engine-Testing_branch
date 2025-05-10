#region States Enum
enum menu_states {
	main,
	game_mode,
	difficulty_mode,
	player_select,
	armor_select,
	multiplayer,
	option,
	key_config,
	stage_select,
	boss_intro,
	audio_settings,
	voice_language,
	weapon_get,
	volume,
	weapon_select,//for weapons and techniques probably. 
	online_select,//are you gonna host or join?
	PVP_map_select,//pick which pvp map you are going to
	title//when the x comes into view. im just gonna make it nice and easy, skip with enter.
}
camera_set_view_size(view_camera[0],global.view_width,global.view_height);
palette_init();
palette_texture_set(plt_megaman_full);
enum background_select { intro, middle, ending }

// State
state = menu_states.title;
state_timer = 0;
substates = [0, 0, 0, 0];
changed_state = false;

// Stage
stage = background_select.intro;
stage_phase = 0;

// Timers
timer = 0;
item_blink_t = 0;
input_timer = 0;
wait_t = 0;
#endregion
// Appear from the Black
transition_create(transition_types.fade_in);
#region Titles
titles[menu_states.main]            = "";
titles[menu_states.game_mode]       = _("GAME MODE");
titles[menu_states.difficulty_mode] = _("DIFFICULTY MODE");
titles[menu_states.player_select]   = _("PLAYER SELECT");
titles[menu_states.option]          = _("OPTION MENU");
titles[menu_states.key_config]      = _("KEY CONFIG");
titles[menu_states.audio_settings]  = _("AUDIO SETTINGS");
titles[menu_states.voice_language]  = _("VOICE LANGUAGE");
titles[menu_states.weapon_get]		= "";
titles[menu_states.volume]		    = _("VOLUME CONTROL");
titles[menu_states.weapon_select]	= _("WEAPON SELECT");
titles[menu_states.online_select]	= _("ONLINE SELECT");
titles[menu_states.PVP_map_select]  = _("PVP MAP SELECT");
#endregion

// Pages
// Needs a lot of refactoring:
// - Suggestion: Use struct for each item, automatic position/size, define function here instead of step event

#region Main
/// Main
page_items[menu_states.main] = [
	[_("GAME START"), [92, 136, 144, 20]],
	[_("OPTIONS"),    [92, 160, 144, 20]],
	[_("EXIT"),       [92, 184, 144, 20]]
];
#endregion
#region Game Mode
page_items[menu_states.game_mode] = [
	[_("SINGLE PLAYER"), [92, 88, 144, 20]],
	[_("MULTIPLAYER"),   [92, 128, 144, 20]]
];
#endregion
#region Online Selection (Dep)
page_items[menu_states.online_select] = [
	[_("HOST"), [92, 88, 144, 20]],
	[_("JOIN"),   [92, 128, 144, 20]]
];
#endregion
#region Difficulty Mode
page_items[menu_states.difficulty_mode] = [
	[_("EASY"),			 [92, 88, 144, 20]],
	[_("NORMAL"),		 [92, 112, 144, 20]],
	[_("HARD"),		     [92, 136, 144, 20]]
];
#endregion
#region weapon selection
page_items[menu_states.weapon_select] = [
	[_("EASY"),			 [92, 88, 144, 20]],
	[_("NORMAL"),		 [92, 112, 144, 20]],
	[_("HARD"),		     [92, 136, 144, 20]]
];
#endregion
#region Settings
enum e_settings {
	window_size
}
// PC
var wsize_options = Get_screen_size_possibilities();
var _res_options = ["SNES", "NES", "DEFAULT"];
page_items[menu_states.option] = [
	[_("WINDOW SIZE"), [64, 64, 200, 20], wsize_options],
	[_("RESOLUTION"), [64, 64, 200, 20], _res_options],
	[_("KEY CONFIG"), [64, 88, 144, 20]],
	[_("AUDIO SETTINGS"), [64, 112, 144, 20]],
	[_("DAMAGE NUMBERS"), [64, 136, 144, 20]],
	[_("BACK"), [64, 160, 144, 20]]
];
settings_load();
settings_apply();

#endregion
#region Player Select

page_items[menu_states.player_select] = [
	"X", "ZERO", "AXL", "MEGAMAN", "EXE"
];
global.golden_armor_enabled = false;

#endregion
#region Key Config
/// Key Config
page = [
	["", []]
];
alen = array_length(global.key_text)
for(var i = 0; i < alen; i++)
{
	page[i + 1] = [_(global.key_text[i]),
					[],
					[key_to_string(global.key_config[i]), gamepad_to_string(global.gamepad_config[i])]
	];
	
}
gamepad_movement_mode_text[0] = "Directional";
gamepad_movement_mode_text[1] = "Joystick";
page[alen + 1] = [_("BACK"), [128, 32 + 14*(alen + 1), 128, 24]];
page_items[menu_states.key_config] = page;
#endregion
#region Stage Select
/// Stage Select
page_items[menu_states.stage_select] = [

];
//// Stage Icons Position
stage_select_positions = [
	[19,  18],
	[67,  18],
	[140, 11],
	[213, 18],
	[261, 18],

	[19, 182],
	[67, 182],
	[140, 189],
	[213, 182],
	[261, 182]
]
#endregion
#region Audio Settings
page_items[menu_states.audio_settings] = [
	[_("VOICE LANGUAGE"),  [64, 64, 144, 20]],
	[_("VOLUME SETTINGS"), [64, 88, 144, 20]],
	[_("BACK"),            [64, 112, 144, 20]]
];
#endregion
#region Voice Language
page_items[menu_states.voice_language] = [];
#endregion
#region Volume Settings
page_items[menu_states.volume] = [
	[_("SFX VOLUME"),      [64, 64, 144, 20]],
	[_("BGM VOLUME"),      [64, 88, 144, 20]],
	[_("BACK"),            [64, 112, 144, 20]]
];
#endregion
#region Weapon Get
weapon_get_props = {
	player: {
		x: 320,
		y: 0,
		move_from: {
			x: -320,
			y: 0
		},
		move_to: {
			x: 40,
			y: 0,
			interval: [0, 60]
		},
		new_weapon: global.new_special_weapon,
		wp_slot: 2,
		visible: false,
		palette_array: [0, 0, 0, 0, 0, 0],
		palette_sprite: noone,
		palette_index: 0,
		palette_swap: false
	},
	blink_limit: 75,
	dark_limit: 120,
	instances: []
};
#endregion
#region boss intro
// Boss Intro Scripts
enum boss_intros {
	eclipse	
}
boss_intro[boss_intros.eclipse] = boss_intro_eclipse;
// Items
items = page_items[menu_states.main];
items_length = array_length(items);
selected_item = 0;
selected_item_next = 0;
item_y = 0;
sound = false;
#endregion
#region input
// Input
inputting = true;
hinput = false;
vinput = false;
hinput_p = false;
vinput_p = false;
enter = false;
select = false;
scr_keys_reset();

// Buttons
buttons = ds_list_create();
btn_length = 0;
#endregion
#region palette
palette_init();
#endregion
#region background
// Layer Background
layer_id = layer_get_id("BG");
layer_bg = layer_background_get_id(layer_id);
#endregion
#region boss intro
boss_intro_sprite = noone;
boss_intro_index = 0;
boss_inst = noone;
boss_object = noone;
boss_room = noone;
boss_name = "";
boss_name_show = false;
boss_defeated = false;
loading_text = "";
#endregion
#region weapon selection
weapon_lerp = 0;
weapon_lerp_time = 6;
weapon_lerp_distance = 26;
weapon_lerp_direction = 1;
weapon_player_selected = pl_char.x;
#endregion
#region title
title_sprite = Big_Intro;
ts_pixels_shown = 1;
ts_move_speed = 1/3;
ts_height = sprite_get_height(title_sprite) / ts_pixels_shown;
ts_time = 0;
#endregion

activate_sprites = true;
if (global.start_menu_force_state) {
	global.start_menu_force_state = false;
	state = global.start_menu_state;
	state_timer = 0;
	changed_state = true;
	items = page_items[state];
	items_length = array_length(items);
	selected_item = selected_item_next;
	selected_item_next = 0;
	activate_sprites = true;
} else if (state == menu_states.main) {
	music_play("TitleTheme");
}

// Character Select Sprites
global.char_select_sprites = [
	spr_player_x,
	spr_player_zero,
	spr_player_axl,
	spr_player_megaman,
	spr_player_exe
];
background_index = 0;
#region animation
animation2_init();
can_activate_sprites = true;
for (var i = 0; i <= P_EXT4; i++) {
	armor[i] = "";
	tmp_armor[i] = "";
	armor_index[i] = 0;
	tmp_armor_index[i] = 0;
	
}
var index = global.character_selected_index[0];
armor = global.player_character_armor[index];
armor_index = global.player_character_armor_index[index];
#endregion

#region pvp maps

pvp_maps = [rm_avalanche,rm_indev,rm_q3dm17];
page_items[menu_states.PVP_map_select] = [[_("RETURN"), [92, 88, 144, 20]]];
for(var q = 0; q < array_length(pvp_maps); q++){
	
array_push(page_items[menu_states.PVP_map_select], [_(room_get_name(pvp_maps[q])),[92, 112 + q * 24, 144, 20]])
}

#endregion
menu_edge_init();
menu_armor_load(0);
menu_player_select_sprites_load(page_items[menu_states.player_select]);
screen_update_stretched();
