event_inherited();
#region Variables
hp = 128;
is_boss = true;
collide_damage = 0;
hit = 0;
state_set(zero_body_pillow2.stand);
#endregion
#region Animations
// Stand
animation_add("S",
	[ 0, 0 ]
);
animation_play("S");
#endregion