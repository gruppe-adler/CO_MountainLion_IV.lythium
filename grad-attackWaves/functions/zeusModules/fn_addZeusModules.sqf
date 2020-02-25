[
	"Jules",
	"Spawn Attack Group", 
	{ 
	params ["_modulePosition"]; 
	[_modulePosition] spawn GRAD_attackWaves_fnc_spawnAttackGroupCar;  
	}
] call zen_custom_modules_fnc_register;