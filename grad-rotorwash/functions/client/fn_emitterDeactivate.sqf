params ["_heli"];

_emitters = _heli getVariable ["grad_rotorwash_emittersActive", []];

{
	deleteVehicle _x;
} forEach _emitters;