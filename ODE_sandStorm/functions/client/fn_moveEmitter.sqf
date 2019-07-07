params ["_type", "_position", "_dropRate"];

private _oldEmitterArray = [_type, "old"] call ODE_sandstorm_fnc_getEmitterArray;
private _newEmitterArray = [_type, "new"] call ODE_sandstorm_fnc_getEmitterArray;

private _emitter = _oldEmitterArray deleteAt 0;

// get direct access to old array
private _identifier = format ["ODE_sandstormEmitterArray_%1_%2", _type, "old"];
missionNamespace setVariable [_identifier, _oldEmitterArray];

systemChat str (count _oldEmitterArray);

// wenn kein emitter vorhanden ist, der gemoved werden kann
if (isNil "_emitter") then {
    // diag_log format ["emitter if: %1", _emitter];
    // neuen emitter spawnen
    _emitter = [_position, _type, _dropRate] call ODE_sandstorm_fnc_createEmitter;

    _emitter setPos _position;
    _emitter setDropInterval _dropRate;

    [_type, "new", _emitter] call ODE_sandstorm_fnc_addToEmitterArray;
} else {
    // diag_log format ["emitter else: %1", _emitter];
    _emitter setPos _position;
    _emitter setDropInterval _dropRate;

    [_type, "new", _emitter] call ODE_sandstorm_fnc_addToEmitterArray;
};