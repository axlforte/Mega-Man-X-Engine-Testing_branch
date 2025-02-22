event_inherited();
#region Variables
hp = 128;
collide_damage = 0;
hit = 0;
face_x = false;
state_set(zero_body_pillow.stand);
#endregion
#region Animations
// Stand
animation_add("S",
	[ 0, 0 ]
);
animation_play("S");
#endregion