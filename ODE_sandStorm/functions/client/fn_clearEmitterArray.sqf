params ["_type"];

private _oldEmittersArray = [_type, "old"] call ODE_sandstorm_fnc_getEmitterArray;
private _newEmittersArray = [_type, "new"] call ODE_sandstorm_fnc_getEmitterArray;

// delete unnecessary emitters
{deleteVehicle _x} forEach _oldEmittersArray;

// diag_log format ["_newEmittersArray %1", _newEmittersArray];

// replace old array with new array
private _identifierOld = format ["ODE_sandstormEmitterArray_%1_%2", _type, "old"];
missionNamespace setVariable [_identifierOld, _newEmittersArray];

private _identifierNew = format ["ODE_sandstormEmitterArray_%1_%2", _type, "new"];
missionNamespace setVariable [_identifierNew, []];