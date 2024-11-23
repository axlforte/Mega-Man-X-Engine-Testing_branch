//get the shift amounts
var xshift = 0;
var midFade = 1;
var leaveFade = 0.5;
var enterFade = 0.5;
if(shift == 3){
	xshift = 17 * dir;
	midFade = 0.65;
	leaveFade = 0.9;
	enterFade = 0.25;
	shift -= 1;
	if(dir == 1)
		draw_sprite_ext(spr4,0,x - 40 + xshift,y,1,1,0,c_white,0.6);
	else
		draw_sprite_ext(spr4,0,x + 40 + xshift,y,1,1,0,c_white,0.6);
} else if(shift == 2){
	midFade = 0.8;
	enterFade = 0.45;
	leaveFade = 0.8;
	xshift = 11 * dir;
	shift -= 1;
	if(dir == 1)
		draw_sprite_ext(spr4,0,x - 40 + xshift,y,1,1,0,c_white,0.45);
	else
		draw_sprite_ext(spr4,0,x + 40 + xshift,y,1,1,0,c_white,0.45);
} else if(shift == 1){
	xshift = 5 * dir;
	midFade = 0.9;
	enterFade = 0.6;
	leaveFade = 0.65;
	shift -= 1;
	if(dir == 1)
		draw_sprite_ext(spr4,0,x - 40 + xshift,y,1,1,0,c_white,0.25);
	else
		draw_sprite_ext(spr4,0,x + 40 + xshift,y,1,1,0,c_white,0.25);
} 

//draw middle biometal icon

spr = biometal_sprites[index];

draw_sprite_ext(spr,0,x + xshift,y,1,1,0,c_white,midFade);

//draw left biometal
spr2 = spr_vent_pickup_lifeup;
if(index == array_length(availible_biometals) - 1){
	spr2 = biometal_sprites[0];
} else {
	spr2 = biometal_sprites[index + 1];
}


if(dir == -1)
draw_sprite_ext(spr2,0,x - 20 + xshift,y,1,1,0,c_white,enterFade);
else
draw_sprite_ext(spr2,0,x - 20 + xshift,y,1,1,0,c_white,leaveFade);

//draw right biometal

spr3 = spr_vent_pickup_lifeup;
if(index == 0){
	spr3 = biometal_sprites[array_length(availible_biometals) - 1];
} else {
	spr3 = biometal_sprites[index - 1];
}
	show_debug_message(spr3);
	
if(dir == 1)
draw_sprite_ext(spr3,0,x + 20 + xshift,y,1,1,0,c_white,enterFade);
else
draw_sprite_ext(spr3,0,x + 20 + xshift,y,1,1,0,c_white,leaveFade);
