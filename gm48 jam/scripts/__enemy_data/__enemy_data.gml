function __enemy_data(){

	DATA_enemy[0] = {
		name : ["Compliance Unit", "GRV-88 Suppression Frame", "Population Control Unit","BRX-90 Bulwark"],
		sprite : sEnemyBig,
		hp : 10,
		str : 1,
		dex : 1,
		actions : noone
	}
	
	DATA_enemy[1] = {
		name : ["VX-Marksman","LR-Scout V3","CX-11 Targeting Unit"],
		sprite : sEnemyRange,
		hp : 5,
		str : 1,
		dex : 4,
		actions : noone
	}
	
	DATA_enemy[2] = {
		name : ["AX-Breaker Unit","CL-Rescue Frame", "MX-4 Breach Unit"],
		sprite : sEnemyMelee,
		hp : 8,
		str : 5,
		dex : 1,
		actions : noone
	}

}