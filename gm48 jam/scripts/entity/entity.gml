function entity(ID) constructor{
	ID = ID
	name = "Unknown"
	sprite_index = sEnemyBig
	image_index = 0
	hp = 10
	str = 1
	dex = 1
	
	x = 0
	y = 0
	image_xscale = 1
	image_yscale = 1
	
	
	lane = 0
	
	actions = noone
	
	function draw(){
		draw_sprite_ext(sprite_index, image_index, x,y,image_xscale,image_yscale,0,c_white,1)
	}
}