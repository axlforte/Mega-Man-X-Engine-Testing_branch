// Movement
var t = timer;
switch(t)
{
    case 3:
    case 6:
    case 8: y -= 1; break;
}
if (t >= 11 && t <= 13) y -= 1;
else if (t >= 16 && t <= 22) y -= 1;
else if (t == 23) y -= 2;

// Destroy
if (t == 24)
{
	if(global.is_online){
		global.client.KillProjectile(self);
	}
    instance_destroy();
    exit;
}
timer++;

