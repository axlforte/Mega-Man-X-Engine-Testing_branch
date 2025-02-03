if(ide < 2){
	var p = instance_create_depth(x,y,depth+1, object_index);
	p.ide = ide + 1;
	p.dir = dir;
	p.owner = owner;
}
abs_hspeed = 3 + ide/3;