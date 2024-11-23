enum zero_body_pillow { stand};
#region States
var t = state_timer++;

switch(state) {
	#region Standing here, i realize
	//that you are just like me
	//trying to make history
	// i cant remember the rest of the lyrics fuck
	case zero_body_pillow.stand:
		animation_play("S");
		if (t >= 60)
		 hp = 128;
		break;
	#endregion
	
}
#endregion