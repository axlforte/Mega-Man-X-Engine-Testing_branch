draw_string_here(0,16,"PLAYER COUNT: "+string(alength(G.server.nicknames)),colors.orange)

var _sht_cnt = 0;

for(var e = 0; e < alength(global.server.shots); e++){
	for(var f = 0; f < alength(global.server.shots[e]); f++){
		_sht_cnt++;
	}
}

draw_string_here(0,24,"SHOTS COUNT: "+string(_sht_cnt),colors.orange)

for(var e = 0; e < alength(global.server.shots); e++){
	for(var f = 0; f < alength(global.server.shots[e]); f++){
		draw_string_here(0,32 + f * 8,string(global.server.shots[e][f]),colors.orange)
	}
}