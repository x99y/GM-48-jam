function fit_text_to_box(_text, _font, _width, _height){

	var _base_text = string_split(_text," ")
	
	draw_set_font(_font)
	
    var _line_height = string_height("A"); // Estimate line height
	var _sep = _line_height*0.2
	
	var _space_size = string_width(" ")

	var _scale = 1
	
	while true{
		var _formated_text = []
		var _cur_width = 0
		var _cur_line = 0
		
		_formated_text[_cur_line] = ""
		
		for(var _word_count = 0; _word_count < array_length(_base_text); _word_count++){
			
			var _word = _base_text[_word_count]

			if "\n" == _word{ 
				_cur_line++
				_formated_text[_cur_line] = "" 
				_cur_width = 0
				continue 
			}//Make a new line
		
			
			var _contains_commands = split_text_and_commands(_word)
			
			var _word_length = 0
		
			//If the word contains a command
			if _contains_commands != false{

				for(var i = 0; i < array_length(_contains_commands); i++){
					var _sub_word = _contains_commands[i]
					var _start_pos = string_pos("[",_sub_word )
					var _end_pos =  string_pos("]",_sub_word ) +1 - _start_pos
													
					if _start_pos == 0 or _end_pos == 1{
						_word_length += string_width(_sub_word)
					}else{
						
						var _command = string_copy(_sub_word, _start_pos+1,_end_pos-2)
				
						if string_char_at(_command,1) == "s"{
						    var _index = asset_get_index(_command);
						    if (sprite_exists(_index)){
								var _sprite_scale = _line_height/sprite_get_height(_index)
								_word_length += sprite_get_width(_index)*_sprite_scale
							}
						}
					}
				
				}
							
			}else{
				_word_length += string_width(_word)
			}
		
		
		
			if _formated_text[_cur_line] != ""{
				_word_length+=_space_size
				_word = " " + _word	
			}
		
			_word_length*=_scale
			
			
			//if we will go to the next line
			if _cur_width + _word_length > _width{

				
				_cur_line++
				_formated_text[_cur_line] = ""
				_cur_width = 0
				_word_length -= _space_size
				_word = string_delete(_word,1,1)
				
				if _word_length > _width{
					// Do something	
					_scale -= 0.01
					break
				}
			}
			
			_formated_text[_cur_line] += _word
			_cur_width += _word_length

			if ((_cur_line+1) * _line_height +_sep*_cur_line) * _scale > _height{
				_scale -= 0.01
				break;
			}
		}
		
		
		if _word_count = array_length(_base_text) or _scale <= 0.1{
			break	
		}
		

		
	}
		

	var _return = {
		text : _formated_text,
		font : _font,
		textbox_width : _width,
		textbox_height : _height,
		scale : _scale
	}
	

	return _return
}