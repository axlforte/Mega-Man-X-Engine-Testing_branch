// Destroy
if (timer == 11)
{
    instance_destroy();
	if(global.is_online){
		global.client.KillProjectile(self);
	}
    exit;
}
timer++;
