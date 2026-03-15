enum STATUS_EFFECT{
	REGEN,
	DECAY,
	VIVIFICATION,
	MECHANIZATION,
	COUNT,
	DMG
}

function __status_effect_data(){
	
	var _color = __config_colours()
	
	status_data[STATUS_EFFECT.REGEN] = {
		name : "Regeneration",
		desc : "Heals a finger x amount at the end of the turn",
		end_of_turn_script : noone,
		status_effect_type : EFFECTS.START_OF_TURN,
		color : _color.c_maroon
	}
	
	status_data[STATUS_EFFECT.VIVIFICATION] = {
		name : "Vivification",
		desc : "Makes a finger more Biological",
		end_of_turn_script : EFFECTS.END_OF_TURN,
		status_effect_type : noone,
		color : _color.c_orange
	}
	
	status_data[STATUS_EFFECT.MECHANIZATION] = {
		name : "Mechanization",
		desc : "Makes a finger more Mechanical",
		end_of_turn_script : EFFECTS.END_OF_TURN,
		status_effect_type : noone,
		color : _color.c_grey
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