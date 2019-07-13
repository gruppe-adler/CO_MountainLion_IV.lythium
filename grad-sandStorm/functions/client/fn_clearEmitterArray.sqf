params ["_type", "_sandstormIdentifier"];

private _emittersArray = [_type, _sandstormIdentifier] call GRAD_sandstorm_fnc_getEmitterArray;

// delete unnecessary emitters
{deleteVehicle _x} forEach _emittersArray;