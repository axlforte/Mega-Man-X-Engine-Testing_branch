enum flydroid { stand, throwing, laugh};
#region States
var t = state_timer++;

switch(state) {
	#region Stand
	case flydroid.stand:
		animation_play("S");
		if (t >= 120)
			state_set(flydroid.throwing);
		break;
	#endregion
	#region Throw Pickaxe
	case flydroid.throwing:
		animation_play("T");
		if (t == 18) {
			var p = instance_create_depth(x + 19*dir, y - 6, depth - 1, obj_dig_labour_axe);
			var g = p.grav; // Gravity
			var d = pl_x - p.x; // Hor Distance
			var h1 = 96 - abs(d) / 8; // Max height relative to the pickaxe
			var h2 = max(0, h1 + pl_y - p.y); // Max height relative to the player
			p.h_speed = d * sqrt(g) / (sqrt(2) * (sqrt(h1) + sqrt(h2)));
			p.v_speed = -sqrt(2 * g * h1);
			p.xscale = (p.h_speed <= 0 ? 1 : -1);
			p.owner = id;
		}
		if (t >= 35) 
			state_set(flydroid.stand);
		break;
	#endregion
}
#endregion