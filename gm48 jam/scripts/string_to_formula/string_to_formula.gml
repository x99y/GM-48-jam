
function string_to_formula(expr) {
    var tokens = tokenize_expression(expr);
	
	tokens = find_variable_values(tokens)
	
	var postfix = infix_to_postfix(tokens);

    return evaluate_postfix(postfix);
}

function tokenize_expression(expr) {
    var tokens = [];
    var num = "";
    
    for (var i = 1; i <= string_length(expr); i++) {
        var ch = string_char_at(expr, i);
        
        if (ch == " ") continue;

        if (ch == "+" || ch == "-" || ch == "*" || ch == "/" || ch == "(" || ch == ")") {
            if (num != "") {
                array_push(tokens, num);
                num = "";
            }
            array_push(tokens, ch);
        } else {
            num += ch;
        }
    }
    if (num != "") {
        array_push(tokens, num);
    }


    return tokens;
}

function infix_to_postfix(tokens) {
    var output = [];
    var ops = [];
	

	var precedence = ds_map_create()
	
	ds_map_add(precedence,"+",1)
	ds_map_add(precedence,"-",1)
	ds_map_add(precedence,"*",2)
	ds_map_add(precedence,"/",2)
    
    for (var i = 0; i < array_length(tokens); i++) {
        var token = tokens[i];
		
      // show_message([token, string_digits("a") == ""])
		
		
        if (string_digits(token) !=  "") {
            array_push(output, real(token));
        } else if (token == "(") {
            array_push(ops, token);
        } else if (token == ")") {
            while (array_length(ops) > 0 && ops[array_length(ops) - 1] != "(") {
                array_push(output, array_pop(ops));
            }
            array_pop(ops); // Remove '('
        } else {
            while (array_length(ops) > 0 && ops[array_length(ops) - 1] != "(" &&
                precedence[? ops[array_length(ops) - 1]] >= precedence[? token]) {
                array_push(output, array_pop(ops));
            }
            array_push(ops, token);
        }
    }
    
    while (array_length(ops) > 0) {
        array_push(output, array_pop(ops));
    }
    
	
	ds_map_destroy(precedence)


    return output;
}

function find_variable_values(postfix){
	
	for(var i = 0; i < array_length(postfix); i ++){
		
		var _word = postfix[i]
		
		if is_string(_word) and string_digits(_word) = ""{
			if _word == "+" or _word == "-"	 or _word =="*" or _word == "/"or _word == "(" or _word == ")"{
				continue
			}
			
			
			if string_pos(".",_word) != 0{
				
				_word = string_split(_word,".")
			
				//method to use object.variable
				var _object = noone
				switch _word[0]{
					case "player": _object = oPlayerController break
					default: _object = self break
				}
				
				
				
				if instance_exists(_object){
					if variable_instance_exists(_object,_word[1]){
						postfix[i] = variable_instance_get(_object, _word[1])
					}
				}
			}else{
				//Check if the card has the var
				if variable_instance_exists(self,_word){
					postfix[i] = variable_instance_get(self,_word)
				}else{
					postfix[i] = 1
				}
			}

		}
	}
	
	return postfix
}

function evaluate_postfix(postfix) {
    var stack = [];

    for (var i = 0; i < array_length(postfix); i++) {
        var token = postfix[i];
        if (is_real(token)) {
            array_push(stack, real(token));
        } else {
            var b = array_pop(stack);
            var a = array_pop(stack);	
			
            var result = 0;
            switch (token) {
                case "+": result = a + b; break;
                case "-": result = a - b; break;
                case "*": result = a * b; break;
                case "/": result = a / b; break;
            }
            array_push(stack, result);
        }
    }
    
    return array_pop(stack);
}
