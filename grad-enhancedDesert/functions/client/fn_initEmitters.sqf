params [["_vehicles",[]]];

{
	[_x] call GRAD_enhancendDust_fnc_addEmitter;
} forEach _vehicles;