function split_text_and_commands(input) {
    var parts = [];
    var i = 1; // Start at character index 1
    var len = string_length(input);
    var buffer = "";
    var in_command = false;

    while (i <= len) {
        var ch = string_char_at(input, i);

        if (ch == "[") {
            if (buffer != "") {
                array_push(parts, buffer);
                buffer = "";
            }
            in_command = true;
            buffer += ch;
        }
        else if (ch == "]" && in_command) {
            buffer += ch;
            array_push(parts, buffer);
            buffer = "";
            in_command = false;
        }
        else {
            buffer += ch;
        }

        i += 1;
    }

    if (buffer != "") {
        array_push(parts, buffer);
    }


	if array_length(parts) = 1 and string_char_at(parts[0],1) != "["{
		return false
	}

    return parts;
}