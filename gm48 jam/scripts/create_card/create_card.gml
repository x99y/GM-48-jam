function create_card(_ID = 0){
	//New commect
	if is_undefined(global.base_cards[_ID]){ 
		with oCardRenderer{

			var _card = new card(_ID)
			var _card_data = card_data[_ID]

			//Add card vars
			if struct_exists(_card_data, "variables"){ 
				var _variables;
				if !is_array( _card_data.variables){
					_variables[0] = _card_data.variables	
				}else{
					_variables = _card_data.variables
				}
				
				//Init all vars used for this card
				for(var i = 0; i < array_length(_variables); i ++){
					var _line = _variables[i]
					_line = string_split(string_trim(_line), "=",1)
					
					var _var_name = _line[0]
					var _var_data = _line[1]

					if string_length(string_digits(_var_data)) == string_length(_var_data){
						_var_data = real(_var_data)
					}
					
					struct_set(_card, _var_name, _var_data);
					
				}
			}
			


			//Card selection requirements
			var _selection_requirements = []
		
			
			//If empty no finger will need to be selecterd
			if struct_exists(_card_data, "selection_finger_type"){
				//Get the requirements
				var _selection_finger_type = _card_data.selection_finger_type

				if !is_array(_selection_finger_type){
					_selection_finger_type = [_selection_finger_type]
				}
				
				var _number_of_fingers = 1
				
				if struct_exists(_card_data, "selection_finger_number"){
					_number_of_fingers = _card_data.selection_finger_number
				}
				
				var _selection_finger_effect = EFFECTS.DESTROY
				
				if struct_exists(_card_data, "selection_finger_effect"){
					_selection_finger_effect = _card_data.selection_finger_effect
				}
				
				//For drawing onto the card
				//what can be selected
				_card.base_finger_requirement = _selection_finger_type
				
				// how many need to be selected
				_card.base_finger_amount = _number_of_fingers
				
				array_push(_selection_requirements, [SELECTION_TYPE.FINGER,_selection_finger_type,_number_of_fingers,_selection_finger_effect])

			}else{
				_card.base_finger_requirement = noone
			}
		
		
			//All other selection requirements
			if  struct_exists(_card_data, "play_selection"){
				
				//This is testing for errors
				var __check_selection_formating = function(_card, _item){
					
					if !is_array(_item){return false}
					
					switch(_item[0]){
						case SELECTION_TYPE.LANE: 
						
							if array_length(_item) != LANE_SELECTION_ARRAY_LENGTH{ return false}
							//TODO CHANGE THGIS !-----------------------------------------------------------------------------------------------
							for(var i = 1; i < LANE_SELECTION_ARRAY_LENGTH; i ++){
								
								var _current_var = _item[i]
								
								if is_string(_current_var){
								}
							}
						break
						
						case SELECTION_TYPE.FINGER: 
							
							if array_length(_item) != FINGER_SELECTION_ARRAY_LENGTH{ return false}
						
							if is_array(_item[1])  and !is_int32(_item[2]){
			
								return true
								
							}else{
								return false
							}
							
						break
						default: return false
					}
					
					
					return true
				}
				
				
				var _formated_selection_vars = noone
				
				//Check if we have multiple entries
				if is_array(_card_data.play_selection) and is_array(_card_data.play_selection[0]){
					var _data_to_add = _card_data.play_selection
				
					for(var i = 0; i < array_length(_data_to_add); i ++){
						if !__check_selection_formating(_card, _card_data.play_selection[i]){
							return card_error("Failed to import all selection data, check for formating issues")
						}else{
							array_push(_selection_requirements,  _card_data.play_selection[i])	
						}
					}			
				}else{
					if !__check_selection_formating(_card, _card_data.play_selection){
						return card_error("Failed to import all selection data, check for formating issues")
					}else{
						array_push(_selection_requirements,  _card_data.play_selection)	
					}
				}
				
				
			}
			

			if array_length(_selection_requirements) != 0 {
				_card.play_selection_requirement = _selection_requirements
			}	
			
			
			//Format the text
			format_card_text(_card,_card_data)
			
			
			//Card sprite creation

			_card.name = _card_data.name
			
			//Create the card image
			var _new_card =  __create_card_sprite(_card)
			
			
			var _sprite = _new_card.sprite
		
		
			_card.sprite_index =_sprite
						
			
			if struct_exists(_new_card,"regions"){
				_card.regions = _new_card.regions
			}
		
			global.base_cards[_ID] = {
				card_object : _card,
				sprite : _sprite
			}
		
		}
	}
	
	return variable_clone(global.base_cards[_ID].card_object)
}


function card_error(msg){
	show_debug_message(msg)
	return variable_clone(global.base_cards[0].card_object)
}