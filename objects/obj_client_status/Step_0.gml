global.chat.step();
if(keyboard_check_pressed(ord("t"))){
	var _chat = get_string("Chat Message", "");
	global.chat_string = _chat;
}