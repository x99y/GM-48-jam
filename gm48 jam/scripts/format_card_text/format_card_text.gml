function format_card_text(_card, _card_data, find_keywords = true, remove_keywords = false){
	
	var _base_text = "No description given :("
	
	if struct_exists(_card_data, "desc"){	_base_text = _card_data.desc }

	 
	var _find_vars = false;
			
	var formated_text = ""
	
	var _count = array_create(array_length(keywords),0)
	

	_base_text = string_replace_all(_base_text,"\n", " \n ")
		
	if find_keywords{
		var _text = string_split(_base_text," ", true)
		
		for(var _word_count = 0; _word_count  < array_length(_text); _word_count ++){
			
			var _cur_word = _text[_word_count]
			
			//Searching for varibles
			if string_char_at(_cur_word,1) == "{" and string_char_at(_cur_word,string_length(_cur_word)) == "}"{
				var _var =	string_trim(string_copy(_cur_word,2,string_length(_cur_word)-2))
				if struct_exists(_card,_var){
					var _data = struct_get(_card,_var)
						
					if typeof(_data) == "number"{
						//if its just the number and not a formula
						_cur_word = string(_data)
					}else{
						var _tokens = tokenize_expression(_data)
						//This means that if the player stats change, this card should too
						_cur_word = ""
						for(var _token_index = 0; _token_index < array_length(_tokens); _token_index ++){
							var _cur_token = _tokens[_token_index]
							
							switch _cur_token{
								case "*": _cur_token = "x" break
								case "-": break
								case "+": break
								case "/": _cur_token = "/" break
									
								default:
									var _player_pos = string_pos("player.",string_lower(_cur_token)) != 0
										
									if  _player_pos != 0{
										_cur_token = string_delete(_cur_token, 1, 7);
											
										for(var j = 0; j < array_length(DATA_stats_keyword); j ++){
											if _cur_token == DATA_stats_keyword[j].var_name{
													_cur_token ="[region:" + string(array_length(keywords)+j) +"]["+DATA_stats_keyword[j].sprite+"][/region]"
													_card.player_stats_incuded = true
												break	
											}
										}
											
									}
										
								break
							}
								
								
							_cur_word += _cur_token
							if _token_index < array_length(_tokens)-1{
								_cur_word += " "
							}
						}							
					}
				}else{
					_cur_word = "1"	
				}
			
			
			
			}else{
				//Searching Words
				for(var key_id = 0; key_id < array_length(keywords); key_id ++){
					var cur_keyword = keywords[key_id]

					if string_lower(_cur_word) == cur_keyword.ID{
						_cur_word = "[region:" + string(key_id) +"]"
					
						_count[key_id] ++
					
						if !remove_keywords{
							if variable_struct_exists(cur_keyword, "color"){
							//if cur_keyword.color != noone{
								_cur_word += "["+string(cur_keyword.color)+"]" + cur_keyword.name + "[/color]"
							
							}else{
								if variable_struct_exists(cur_keyword, "sprite"){
									_cur_word +="["+cur_keyword.sprite+"]"
								}
							}
						
						}else{
												
							var _temp = ""
							var _w = string_width(cur_keyword.name)
							if cur_keyword.sprite != noone{
								_w = sprite_get_width(cur_keyword.sprite)
							}
						
							while string_width(_temp) < _w{
								_temp += " "
							}
							_cur_word += _temp
						
						}
					
					
					
						_cur_word += "[/region]"
					
						break
					}	
				}
			}
			
			formated_text += _cur_word 
				
			if _word_count != array_length(_text) -1{
				formated_text += " "
			}
		}
	}else{
		formated_text = _base_text	
	}





	_card.desc_formated = formated_text


	
}
