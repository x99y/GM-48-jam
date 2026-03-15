enum STATUS_EFFECT{
	REGEN,
	DECAY,
	COUNT
}

function __status_effect_data(){
	
	var _color = __config_colours()
	
	status_data[STATUS_EFFECT.REGEN] = {
		name : "Degeneration",
		desc : "Heals a finger x amount at the end of the turn",
		end_of_turn_script : noone,
		status_effect_type : EFFECTS.START_OF_TURN,
		color : _color.c_maroon
	}
	
	status_data[STATUS_EFFECT.DECAY] = {
		name : "Decay",
		desc : "Damages a finger x amount at the end of the turn",
		end_of_turn_script : noone,
		status_effect_type : EFFECTS.START_OF_TURN,
		color : _color.c_white
	}
	
	return status_data
}