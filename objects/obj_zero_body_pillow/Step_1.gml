PAUSE;
if (light > 0){
	light--;
	var hnum = instance_create_depth(x,y,-600, obj_hit_number);
	hnum.dam = hurt;
	combo += hurt;
	comboTime = comboMax;
}