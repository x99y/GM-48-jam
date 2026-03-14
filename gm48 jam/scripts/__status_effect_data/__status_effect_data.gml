enum STATUS_EFFECT{
	REGEN,
	DECAY,
	COUNT
}

function __status_effect_data(){
	status_data[STATUS_EFFECT.REGEN] = {
		name : "Degeneration",
		desc : "Heals a finger x amount at the end of the turn",
		end_of_turn_script : noone,
		status_effect_type : EFFECTS.START_OF_TURN
	}
	
	status_data[STATUS_EFFECT.DECAY] = {
		name : "Decay",
		desc : "Damages a finger x amount at the end of the turn",
		end_of_turn_script : noone,
		status_effect_type : EFFECTS.START_OF_TURN
	}
	
	return status_data
}