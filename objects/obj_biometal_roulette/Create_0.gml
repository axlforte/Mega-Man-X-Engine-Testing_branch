availible_biometals = [
"hu",
"x",
"zx"//,
//"hx",
//"lx",
//"fx",
//"px",
//"ox",
//"o1x"
]

biometal_sprites = [
spr_vent_pickup_lifeup,
spr_x_pickup_lifeup,
spr_zero_pickup_lifeup,
spr_axl_pickup_lifeup,
spr_megaman_pickup_lifeup,
spr_pickup_wp_3,
spr_pickup_life_3
];

spr = "";
spr2 = "";
spr3 = "";
spr4 = "";

index = 0;
shift = 0;
dir = 1;
can_select = false;
scr_keys_reset();


	var mp = instance_nearest(x,y,obj_player_parent);
	
	if(mp.dir == -1){
		x -= 16;	
	}