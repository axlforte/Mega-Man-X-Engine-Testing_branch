draw_sprite(sprite_index,0,0,0);

for(var q = 0; q < array_length(chips); q++){
	draw_sprite_ext(Cheeps,chips[q].image, (q mod 5) * 16 + 8, floor(q / 5) * 24 + 106,1,1,0,
	(chip_avail[q] ? c_white : #0f0f0f),1);
}
reticle_frame+=0.25;
if(on_add){
	draw_sprite(reticel1,(reticle_frame mod 4), 92, 110);
} else {
	draw_sprite(reticel1,(reticle_frame mod 4), (index mod 5) * 16 + 4, floor(index / 5) * 24 + 102);
}
draw_string_here(8,60,chips[index].name, colors.blue);
draw_sprite(Chip_Preview,chips[index].preview, 16, 16);
draw_string_here(8,74,chips[index].code,colors.orange);

//selection
for(var w = 0; w < array_length(selected_chips); w++){
	draw_sprite(Cheeps,selected_chips[w].image,96,24 + w * 16);
}