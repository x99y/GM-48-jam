function init_card_database(){
	//not a good method of storing data but i cant be bothered using .json since idk how gamemaker handles it
	card_data[0] = {
		name : "Empty card_data", //name
		desc : "Empty play description",
		rarity : RARITY.COMMON,
		selection_finger_type : SELECTION_FINGER_TYPE.ALL, //not all by default
		selection_finger_number : 1, //one by default
		selection_finger_effect : EFFECTS.DESTROY, //Destroy by default
		
		//NOTE the above selection struct is not actually required, it just formats it like below.
		
		play_selection : [
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,EFFECTS.DESTROY],
		
		 //PLay selection is not required, but this is the formated selection for fingers
		//					[	Type of selection, [List of what you can select], how many fingers you select at once, what happens when the fingers are selected		]
		// Play selection can have multiple diffrent selection info mation ie we select a finger to destroy and the next is a finger to heal
		// just make sure they are all wrapped in a array (example below)
		//[
		// [Selection array 1],
		// [selection array 2]
		//]
		
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],3,[STATUS_EFFECT.REGEN,2]]
		
		//Sometimes instead of a EFFECT, liek destroy we can give the finger a status effect. You can add more to the enum, they dont do anything yet tho
		//	[status effect, intesity of effeect]
		
		], 
		
		
		//Below is being built ignore for now
		lane_selection : LANE_SELECTION.SELF,
		play_scripts : [[draw_card],[draw_card]], //play effect
	}
	
	card_data[1] = {
		name : "Jawbreaker", //name
		desc : "Hits {str} in front of you, applies {dec} decay to two fingers",
		variables: ["str=player.str+2", "dec= 1"],
		rarity : RARITY.COMMON,

		play_selection : 
			[
			[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,[STATUS_EFFECT.DECAY,"dec"]],
			[SELECTION_TYPE.CONDITIONAL,is_biological,0,
				[//yes it is
					[SELECTION_TYPE.LANE,LANE_SELECTION.SELF,1,[LANE_EFFECTS.DMG,DMG_TYPE.BLUNT,"str"]]
				],
				[//no it isnt
					[SELECTION_TYPE.LANE,LANE_SELECTION.SELF,1,[LANE_EFFECTS.DMG,DMG_TYPE.BLUNT,1]]
				]
			],
			],
			
		play_scripts : [
			[SELECTION_TYPE.CONDITIONAL,is_biological,0,
			[[player_draw_card],[player_draw_card]],
			
			[[player_draw_card]]]
		]
	}
	
	
	card_data[2] = {
		name : "Paper Cut", //name
		desc : "Damage a Bio finger {const} , to d1 * 2",
		variables: ["const=4-player.con"],
		
		// Needs damage + effect
		play_selection : [SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.BIOLOGICAL],1,EFFECTS.NONE],

		play_script : [[player_draw_card],[player_draw_card]], //play effect
	}
	
	card_data[3] = {
		//TODO ADD DMG -----------------------------------------------------------------------------------------------------------------------------------------
		name : "Synthesis", //name
		desc : "Damage a Bio finger 1, add Mechanization",
		
		play_selection : [SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.BIOLOGICAL],1,[STATUS_EFFECT.MECHANIZATION,1]]
	}	

	card_data[4] = {
		name : "Cancerous Growth", //name
		desc : "Add Regen 3 to a Bio finger, Decay 3 fingers 1 time",
		
		play_selection :[
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,[STATUS_EFFECT.REGEN,3]],
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,[STATUS_EFFECT.DECAY,1]],
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,[STATUS_EFFECT.DECAY,1]],
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,[STATUS_EFFECT.DECAY,1]],
		]
	}

	card_data[5] = {
		name : "Assimilation", //name
		desc : "Destroyed a bio finger, create a mechanical finger",

		play_selection :[
						[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.BIOLOGICAL],1,EFFECTS.DESTROY],
						[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.DESTROYED],1,EFFECTS.MECH_HEAL]
						]
	}	

	card_data[6] = {
		name : "Malignance", //name
		desc : "Damage a Mech finger 1, add Vivifaction",
		
		play_selection : [SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL],1,[STATUS_EFFECT.VIVIFICATION,1]]
	}

	card_data[7] = {
		name : "Sidestep", //name
		desc : "Move 1",
		
		play_selection :[SELECTION_TYPE.LANE,LANE_SELECTION.NOT_SELF_SIDE,1,LANE_EFFECTS.MOVE], 

	}

	card_data[8] = {
		name : "Shoulder Charge", //name
		desc : "Move 1, Shove Right",
		
		play_selection :[
		[SELECTION_TYPE.LANE,LANE_SELECTION.NOT_SELF_SIDE,1,LANE_EFFECTS.MOVE],
		[SELECTION_TYPE.LANE,LANE_SELECTION.SELF,1,LANE_EFFECTS.SHOVE_RIGHT],
		], 
	}

	card_data[9] = {
		name : "Repair", //name
		desc : "Heal a Mech finger, Decay and Mechanize a Bio", 
		
		play_selection :[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,EFFECTS.NONE],
		
		play_scripts : [
			[SELECTION_TYPE.CONDITIONAL,is_mechanical,0,
			[[apply_status_to_selection,0, STATUS_EFFECT.REGEN, 2]],//yes it is
			[[apply_status_to_selection,0, STATUS_EFFECT.DECAY, 2], [apply_status_to_selection,0, STATUS_EFFECT.MECHANIZATION, 2]]
			]// no it isnt
			] //play effect
	}

	card_data[10] = {
		name : "Improvised Projectile", //name
		desc : "Damage {lob} up to 3 away", 
		variables: ["lob=player.dex"],
		
		play_selection : [SELECTION_TYPE.LANE,LANE_SELECTION.ANY,1,[LANE_EFFECTS.DMG,DMG_TYPE.BLUNT,"lob"]],

	}
	
}
/*/
}