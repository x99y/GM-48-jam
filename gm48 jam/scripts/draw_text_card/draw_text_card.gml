function draw_text_card(_formated_txt, _xx, _yy, _wCenter = false, _hCenter = false, _x_scale = 1, _y_scale = 1){
	/// Draws a given string 

	if is_undefined(_formated_txt){return}

	var txt = _formated_txt.text
	var fit_scale = _formated_txt.scale

	draw_set_font(_formated_txt.font)
	
	var adjusted_xscale = fit_scale*_x_scale
	var adjusted_yscale = fit_scale*_y_scale
	
	
    var _line_height = string_height("A"); // Estimate line height
	var _sep = _line_height*0.2
		
	var _startx = _xx
	var _starty = _yy
	
	var _xoffset = 0
	var _yoffset = 0

	if _hCenter {
		_yoffset = (_formated_txt.textbox_height*_y_scale-((array_length(txt)) * _line_height +_sep*(array_length(txt)-1)) * fit_scale)/2
	}
	
	
	var drawn_text = ""

	
	
	for(var i = 0; i < array_length(txt); i ++){


		
		var _cur_text = txt[i]
		var _txt_commands = split_text_and_commands(_cur_text)


		var _ypos = _starty+_yoffset+(_line_height*i+_sep*i)*fit_scale
		var _xpos = 0
		
		if _txt_commands = false{
			
			if _wCenter {
				_xoffset = round((_formated_txt.textbox_width - string_width(_cur_text)*fit_scale)/2)
			}
			
			draw_text_transformed(_startx +_xoffset,_ypos,_cur_text,adjusted_xscale,adjusted_yscale,0)
			
		}else{
			
			if _wCenter {
				var _width = 0
				
				for(var j = 0; j < array_length(_txt_commands); j ++){
					var _word = _txt_commands[j]
					if string_char_at(_word,1) != "["{ 
						_width += string_width(_word) 
					}else{
						var _command = string_copy(_word, 2,string_length(_word)-2)
						
						if  string_char_at(_command,1) = "s"{
							var _index = asset_get_index(_command);
							if (sprite_exists(_index)){
								var _sprite_scale = _line_height/sprite_get_height(_index)
								_width += sprite_get_width(_index)*_sprite_scale
							}
						}
					}
					
					
				}

				_xoffset = round((_formated_txt.textbox_width - _width*fit_scale)/2)
			}
			

			for(var j = 0; j < array_length(_txt_commands); j ++){
				var _word = _txt_commands[j]
				if string_char_at(_word,1) == "["{
					var _command = string_copy(_word, 2,string_length(_word)-2)	
					
					var _command_key = string_char_at(_command,1)
					switch (_command_key){
						case "/":
												
							switch _command{
								case "/color": draw_set_color(c_white) break	
								case "/region": 
									array_push(temp_card_regions,[_region_start_pos,[_startx +_xoffset + _xpos,_ypos+_line_height],_id])
								break
							
							}
						break
						case "c":
							colour_commands = __config_colours()
							if struct_exists(colour_commands, _command){
								draw_set_color(struct_get(colour_commands,_command))	
							}
						
						break;
						
						case "s":
							var _index = asset_get_index(_command);

						    if (sprite_exists(_index)){
								var _sprite_scale = _line_height*0.8/sprite_get_height(_index)
								draw_sprite_ext(_index,0,_startx +_xoffset + _xpos,_ypos,_sprite_scale,_sprite_scale,0,c_white,1)
								_xpos += sprite_get_width(_index)*_sprite_scale
							}
						break
						
						case "r":
							
							var _region_start_pos = [_startx +_xoffset + _xpos,_ypos]
							var _id = string_split(_command,":")
							
							if array_length(_id) == 2{
								_id = _id[1]
							}
							
						break
						
					}
					
					
				}else{
					
					draw_text_transformed(_startx +_xoffset + _xpos,_ypos,_word,adjusted_xscale,adjusted_yscale,0)
					
					_xpos += string_width(_word)*fit_scale
								
				}
			}
		}
	}

}