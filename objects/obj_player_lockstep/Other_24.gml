/// @description State Machine
fsm
	.history_enable()
	.history_set_max_size(2)
	.event_set_default_function("draw", function() {
		if (isMe) {
			draw_sprite(spr_player_arrow, 0, x, y - 24);
		}
		draw_sprite_ext(sprite_index, imageIndex, x, y, face * image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	})
	.add("idle", {
		enter: function() {
			animationPlay("idle");
			setSpeed(0, 0);
		},
		step: function() {
			applyGravity();
			moveAndCollide();
		}
	})
	.add("run", {
		enter: function() {
			animationPlay("run");
		},
		step: function() {
			setMovement();
			applyGravity();
			moveAndCollide();
		}
	})
	.add("jump", {
		enter: function() {
			animationPlay("jump");
			vspd = -jspd;
		},
		step: function() {
			setMovement();
			applyGravity();
			moveAndCollide();
		}
	})
	.add("fall", {
		enter: function() {
			animationPlay("fall");			
		},
		step: function() {
			setMovement();
			applyGravity();
			moveAndCollide();
		}
	})
	.add_transition("t_run", "idle", "run")
	.add_transition("t_jump", ["idle", "run"], "jump")
	.add_transition("t_transition", ["idle", "run"], "fall", function() { return !onGround(); })
	.add_transition("t_transition", "jump", "fall", function() { return (vspd >= 0); })
	.add_transition("t_transition", "run", "idle", function() { return (input.hdir == 0); })
	.add_transition("t_transition", "fall", "idle", function() { return onGround(); });
	
serializer = new Serializer()
	.addVariable("x")
	.addVariable("y")
	.addVariable("sprite_index")
	.addVariable("imageIndex")
	.addVariable("hspd")
	.addVariable("vspd")
	.addVariable("animation")
	.addVariable("animationType")
	.addVariable("shooting")
	.addVariable("shootTimer")
	.addVariable("shootDuration")
	.addCustom("fsm")
	.addClone("input");
	
step = function() {
	checkInput();
	fsm.step();
	fsm.trigger("t_transition");
	if (abs(input.hdir)) fsm.trigger("t_run");
	if (input.jump) fsm.trigger("t_jump");
	x = clamp(x, 8, room_width - 8);

	if (input.attackPressed) {
		shootTimer = 0;
		shooting = true;
		shootProjectile(obj_shot_lockstep);
		animationType = "shoot";
	}

	if (shooting) {
		shootTimer++;
		if (shootTimer >= shootDuration) {
			shootTimer = 0;
			shooting = false;
			animationType = "normal";
		}
	}
	animationUpdateType();
	if (bbox_top >= room_height) {
		x = xstart;
		y = ystart;
	}
	imageIndex = (imageIndex + 1/4) mod image_number;
}














