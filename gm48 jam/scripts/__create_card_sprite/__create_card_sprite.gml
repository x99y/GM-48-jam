function __create_card_sprite(_card, _sprite_index = noone, _surface = -1){
	//Draw
	with oCardRenderer{
				
		if !surface_exists(_surface) _surface = surface_create(GUI_CARD_SPRITE_WIDTH, GUI_CARD_SPRITE_HEIGHT)

		var _x = GUI_CARD_SPRITE_WIDTH/2
		var _y = GUI_CARD_SPRITE_HEIGHT/2
	
		
		var name = _card.name
		var play_desc = _card.desc_formated

		var x_scale = GUI_CARD_SPRITE_WIDTH/CARD_BASE_WIDTH
		var y_scale = GUI_CARD_SPRITE_HEIGHT/CARD_BASE_HEIGHT


		//Regions
		temp_card_regions = []

		var formated_name = fit_text_to_box(name,fntCardName,CARD_NAME_MAX_WIDTH*x_scale,CARD_NAME_MAX_HEIGHT*y_scale)

		var formated_desc = fit_text_to_box(play_desc,fntCard,CARD_DESC_MAX_WIDTH*x_scale,CARD_DESC_MAX_HEIGHT*y_scale)

		var _type = irandom(1)
	
		surface_set_target(_surface)
		{
			draw_clear_alpha(c_black, 0)
			//draw stuff here, remember 0,0 is the top left of the *surface*

			draw_sprite_ext(sCardVariants, _type, _x, _y, x_scale,y_scale, 0, c_white, 1)
			
			var _icon ;
			if _type = 0{
				_icon = sIconArtMech
			}else{
				_icon = sIconArtOrg	
			}
			draw_sprite_ext(_icon, irandom(sprite_get_number(_icon)), _x, _y, x_scale,y_scale, 0, c_white, 1)
			//draw_sprite_ext(Sprite27,0,_x,_y,1,1,0,c_white,1)

			//Draw the cards text		
			draw_text_card(formated_name,_x+CARD_NAME_START_X*x_scale,_y+CARD_NAME_START_Y*x_scale,true,true)
			
			draw_text_card(formated_desc,_x+CARD_DESC_START_X*x_scale,_y+CARD_DESC_START_Y*y_scale,true,true)
	
			

			//TEMP draw the places to play the card to
			//if _card.base_limb_required != noone{
		//		draw_text(_x+CARD_NAME_START_X*x_scale,_y+CARD_NAME_START_Y*y_scale,_card.base_limb_required.temp_text)
	//		}
		

		}


		surface_reset_target()
	
		if _sprite_index = noone{
			_sprite_index = sprite_create_from_surface(_surface, 0, 0, GUI_CARD_SPRITE_WIDTH, GUI_CARD_SPRITE_HEIGHT, false, false, _x, _y);
		}else{
			sprite_add_from_surface(_sprite_index,_surface,0,0,GUI_CARD_SPRITE_WIDTH,GUI_CARD_SPRITE_HEIGHT,false,false)
		}
	}
	
	surface_free(_surface)

	var _return_struct = {
		sprite : _sprite_index
	}

	if array_length(temp_card_regions) > 0{
		
		var _region_xscale = GUI_DISPLAYED_CARD_WIDTH / CARD_BASE_WIDTH / GUI_CARD_SPRITE_SCALE
		var _region_yscale = GUI_DISPLAYED_CARD_HEIGHT / CARD_BASE_HEIGHT / GUI_CARD_SPRITE_SCALE  
		
		
		for(var i = 0; i < array_length(temp_card_regions); i ++){
			for(var j = 0; j < 2; j ++){
				temp_card_regions[i][j][0] = (temp_card_regions[i][j][0] - _x) * _region_xscale
				temp_card_regions[i][j][1] = (temp_card_regions[i][j][1] - _y) * _region_yscale
				
			}
			temp_card_regions[i][2] = safe_real(string_digits(temp_card_regions[i][2]))
		}
			
		struct_set(_return_struct,"regions",temp_card_regions)
	}
	

	return _return_struct
}	
