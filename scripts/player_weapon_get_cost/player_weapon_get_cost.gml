function player_weapon_get_cost() {
	var wp = argument[0]; 
	var lvl = (argument_count > 1 ? argument[1] : previous_charge_level);
	var costs = global.weapon[wp].costs;
	var length = array_length_1d(costs);
	var cost = costs[clamp(lvl, 0, length - 1)];
	if (cost == -1) {
		return global.weapon[wp].energy_max;
	}
	return cost * (1 - weapon_cost_reduce_rate);


}
