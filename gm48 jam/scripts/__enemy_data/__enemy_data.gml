function __enemy_data(){

	enum INTENT_TYPE{
		ATTACKF,	
		ATTACKS,	
		MOVE,
		BUFF,
		HEAL
	}

	DATA_enemy[0] = {
		name : ["Compliance Unit", "GRV-88 Suppression Frame", "Population Control Unit","BRX-90 Bulwark"],
		sprite : sEnemyBig,
		hp : 15,
		str : 3,
		dex : 3,
	    actions : [
	        { action: action_hit_fstrength, weight: 40, intent_type: INTENT_TYPE.ATTACKF },
	        { action: action_hit_sstrength, weight: 20, intent_type: INTENT_TYPE.ATTACKS},
	        { action: action_move,weight: 20, intent_type: INTENT_TYPE.MOVE},
	        { action: buff_attack,weight: 10, args: 3, intent_type: INTENT_TYPE.BUFF},
	        { action: heal,weight: 10, args: 4, intent_type: INTENT_TYPE.HEAL }
	    ]
	}
	
	DATA_enemy[1] = {
		name : ["VX-Marksman","LR-Scout V3","CX-11 Targeting Unit"],
		sprite : sEnemyRange,
		hp : 5,
		str : 1,
		dex : 4,
    actions : [
		{ action: action_hit_sdex,weight: 50, intent_type: INTENT_TYPE.ATTACKF },
		{ action: action_hit_fdex,weight: 20, intent_type: INTENT_TYPE.ATTACKS },
		{ action: action_move,weight: 10,intent_type: INTENT_TYPE.MOVE},
		{ action: buff_dex,weight: 20, args: 3, intent_type: INTENT_TYPE.BUFF}
	]
	}
	
	DATA_enemy[2] = {
		name : ["AX-Breaker Unit","CL-Rescue Frame", "MX-4 Breach Unit"],
		sprite : sEnemyMelee,
		hp : 8,
		str : 5,
		dex : 1,
		actions : [
        { action: action_hit_fstrength,weight: 55, intent_type: INTENT_TYPE.ATTACKF},
        { action: action_move,weight: 15, intent_type: INTENT_TYPE.MOVE},
        { action: action_hit_sstrength,weight: 10, intent_type: INTENT_TYPE.ATTACKS},
		{ action: buff_attack,weight: 20, args: 3, intent_type: INTENT_TYPE.BUFF},
    ]
	}

}