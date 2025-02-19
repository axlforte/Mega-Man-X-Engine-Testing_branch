if(keyboard_check_pressed(ord("t"))){
	chatting = !chatting;
	keyboard_string = "";
	
	global.chat_string = chat_string;
	chat_string = "";
}

if(chatting){
	chat_string = keyboard_string;
}