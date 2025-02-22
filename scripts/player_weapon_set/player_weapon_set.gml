function player_weapon_set() {
	var _id = argument[0];
	var _weapon = argument[1];

	weapon_slot_handler.add_weapon(_weapon, _id)

	if (_weapon == WEAPONS.speed_gear || _weapon == WEAPONS.power_gear) {
		double_gear_unlocked = true;	
	}

}
