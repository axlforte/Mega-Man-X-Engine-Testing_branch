// Is me?
isMe = false;

// Setup
mask_index = spr_blastalot_idle;

// Declare methods
event_user(15);

// Sprite management
sprites = {};
playerIndex = 0;
spriteSettings = {
	prefixes: {
		normal: "",
		shoot: "_shoot"
	},
	actions: [
		"idle",
		"jump",
		"fall",
		"run"
	]
}
animationType = "normal";
typePrefix = {
	normal: "",
	shoot: "_shoot",
};
initSprites("blastalot", spriteSettings);

// Variables
spd = 1.5;
hspd = 0;
vspd = 0;
vspdMax = 10;

jspd = 10;
gravGround = .5;	// Normal gravity
grav = gravGround;

face = 1;

animation = "idle";

sendTimer = 0;
sendTimerInterval = 1;

stateArray = [];

shooting = false;
shootTimer = 0;
shootDuration = 10;

// Input
input = {};
image_speed = 0;
onCreation = true;

imageIndex = 0;
// State Machine
fsm = new SnowState("idle", false);
event_user(14);