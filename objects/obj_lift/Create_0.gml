coll = instance_create_depth(x,y,depth,obj_square_16);
coll.image_xscale = 6;
coll.image_yscale = 2;
if(instance_exists(obj_player_zero)) 
	positions = [241,834,900,1138];
else
	positions = [239,832,896,1136];
index = 3;
players_fat_ass = 10;
//this is gonna confuse the fuck out of people, but its convenient
y = positions[index];

enum lift {
	up, down, idle
}

state = lift.idle;