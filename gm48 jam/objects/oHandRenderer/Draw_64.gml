shader_set(shPalette);

if (shake) {
	  if (shake_timer >= 6) {
        shake_timer = 0
        shake_dest_x = random_range(-2.5, 2.5);
        shake_dest_y = random_range(-1, 1);
		start_shake_x = shake_x
		start_shake_y = shake_y
    }
	
   
	shake_x = ease_out(shake_timer,start_shake_x,shake_dest_x-start_shake_x,6)
	shake_y = ease_out(shake_timer,start_shake_y,shake_dest_y-start_shake_y,6)
	
	shake_timer++;	
}else{
	shake_x = 0;
	shake_y = 0;
}

sprite_frame += image_speed;

draw_sprite_ext(sprite_hand,sprite_frame,x + shake_x,y+ shake_y,x_scale,y_scale,0,c_white,1)

if (sprite_frame >= sprite_number - 1) && sprite_hand = sHandHRise
	{
		image_speed = 0;
		sprite_f1 = sFinger1;
		sprite_f2 = sFinger2;
		sprite_f3 = sFinger3;
		sprite_f4 = sFinger4;
		sprite_f5 = sFinger5;
		sprite_hand = sHand;
	}


var _finger_count = array_length(global.player_fingers)
		
for(var _j = 0; _j < _finger_count; _j ++){
	var _cur = global.player_fingers[_j];
			
	_cur.draw(shake_x,shake_y)
}

shader_reset();