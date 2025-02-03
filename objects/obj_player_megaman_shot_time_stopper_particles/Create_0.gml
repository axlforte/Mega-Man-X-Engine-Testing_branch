animation_init();
animations_init();
depth = -1000000;

animation_add("D", [
0, 0, 
4, 1, 
8, 2, 
12,3
], 12);

animation_play("D")
t = 0;