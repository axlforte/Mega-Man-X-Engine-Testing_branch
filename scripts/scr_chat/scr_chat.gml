function Chat() constructor {
    self.messages = [];
    self.historySize = 3;
    self.pos = { x: 8, y:190 };
    self.marginTop = 0;
    self.marginLeft = 16;
    self.rowSeparation = 16;
    self.typing = false;
    self.currentText = "";
    self.font = spr_font_small;
    self.badgeSpace = 0;
    self.cursorTimer = 0;
    self.cursorVisible = false;
    self.cursorInterval = 40;
    self.cursorChar = "|";
	self.visible_timer = 0;
	self.visible_max = 480;
	scr_keys_reset();
	palette_init();
    static getPressed = function() {
        return keyboard_check_pressed(global.key_chat);    
    }
    static addMessage = function(_name = "", _text = "", _name_color = c_black, _text_color = c_black, _badge = -1) {
        array_push(self.messages, {
            name: _name,
            text: _text,
            nameColor: _name_color,
            textColor: _text_color,
            badge: _badge
        });
		visible_timer = visible_max / 2;
        var _len = array_length(messages);
        if (_len > historySize) {
            array_delete(messages, 0, _len - historySize);    
        }
    }
    static processMessage = function(_text) {
        var _admin = global.is_server;
        if (_admin) {
            if (_text == "/spawn") {
                //global.playerEnemySpawner.toggleEnabled();
                return;
            }
        }
        sendChatMessageToServer(_text);
    }
    static sendChatMessageToServer = function(_text) {
        global.client.rpc.sendNotification("chat.message", {
            text: _text,
			name: global.client.nickname
        });
    }
    static step = function() {
        if (typing) {
            currentText = keyboard_string;
        }
        if (getPressed()) {
            if (!typing) {
                typing = true;
                cursorTimer = 0;
                keyboard_string = currentText;
            } else {
                if (string_length(currentText) > 0) {
					string_delete(currentText,string_length(currentText) - 2,1)
                    processMessage(currentText);
                }
                currentText = "";
                typing = false;
                cursorVisible = false;
            }
        }
        if (typing) {        
            cursorTimer = (cursorTimer + 1) mod cursorInterval;
            cursorVisible = (cursorTimer < cursorInterval / 2);
			visible_timer = visible_max;
        } else {
			if(visible_timer > 0){
				visible_timer--;	
			}
		}
    }
    static draw = function() {
		if(visible_timer <= 0 || visible_timer < visible_max / 2 && visible_timer mod 2 == 0)
			return;
        var _len = array_length(messages);
        for (var _i = 0; _i < _len; _i++) {
            var _message = messages[_i];
            var _x = pos.x + marginLeft;
            var _y = pos.y + marginTop + _i * rowSeparation;
            var _name_text = _message.name + ":";
            // Draw badge, if it is defined
            if (_message.badge != -1) {
                var _width = sprite_get_width(spr_player_chat_icons);
                draw_sprite(spr_player_chat_icons, _message.badge, 
				 _x - badgeSpace - _width, _y);
            }
            // Draw name with color
            if (_message.name != "") {
                draw_string_here(_x, _y, _name_text, colors.pink, true, 7);
                _x += (string_length(_name_text) - 1) * 7;
            }
            draw_string_here(_x, _y, _message.text, colors.orange, true, 7);
        }
        draw_set_color(c_black);
        var _text = "_" + currentText + (cursorVisible ? cursorChar : "");
        draw_string_here(pos.x + marginLeft, pos.y - 16, _text, colors.purple, true, 7);
    }
}

function ServerChatRPC() constructor {
    server = other;
    server.rpc.registerHandler("chat.message", function(_params, _client) {
        var _id = _client.id;
        var _nuck = _params.name;//ignore the weird spelling. its canon now
        var _text = _params.text;
        if (_text == "") return;
        _text = string_copy(_text, 1, 100);
        var _name_color = #f0f0f0;
        var _text_color = #0f0f0f;
        var _badge = getChatBadge();
        var _data = {
            name: _nuck,
            text: _text,
            nameColor: _name_color,
            textColor: _text_color,
            badge: _badge
        };
        server.rpc.sendNotification("chat.message", _data, server.roomSockets);
    });
}

function getChatBadge(){
	if(instance_exists(obj_player_x)){
		if(global.player_character_armor[pl_char.x][1] == x_armor.x1)
			return 1;
		if(global.player_character_armor[pl_char.x][1] == x_armor.x2)
			return 2;
		if(global.player_character_armor[pl_char.x][1] == x_armor.x3)
			return 3;
		if(global.player_character_armor[pl_char.x][1] == x_armor.falcon)
			return 4;
		if(global.player_character_armor[pl_char.x][1] == x_armor.x7)
			return 5;
		if(global.player_character_armor[pl_char.x][1] == x_armor.ultimate)
			return 6;
	} else if(instance_exists(obj_player_zero)){
		return 7;
	} else if(instance_exists(obj_player_axl)){
		return 9;
	} else if(instance_exists(obj_player_megaman)){
		return 11;
	} else if(instance_exists(obj_player_exe)){
		return 11;
	} else {
		return 0;
	}
}


function ClientChatRPC() constructor {
    client = other;
    client.rpc.registerHandler("chat.message", function(_params) {
        global.chat.addMessage(
            _params.name, _params.text, 
            _params.nameColor, _params.textColor, _params.badge);
    });
}