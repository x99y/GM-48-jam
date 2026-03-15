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

var _offset = sin(time) * amp;
var _offsetrot = sin(time*0.5) * amp;
draw_text_ext_transformed(40,20+_offset,"press enter to end turn",10,300,1.5,1.5,0+(_offsetrot*0.2))

draw_sprite_ext(sprite_hand,sprite_frame,x + shake_x,y+ shake_y,x_scale,y_scale,0,c_white,1)

sprite_frame += image_speed;

//If we are entering
if sprite_hand = sHandRise{
	if (sprite_frame >= sprite_number - 1) 
	{
		animate("idle")
	}
}

var _finger_count = array_length(global.player_fingers)
for(var _j = 0; _j < _finger_count; _j ++){
	var _cur = global.player_fingers[_j];
	
	if _cur.state != FINGER_STATE.DESTROYED{
	
		_cur.image_index = sprite_frame
	
	}
	_cur.draw(shake_x,shake_y)
}

shader_reset();