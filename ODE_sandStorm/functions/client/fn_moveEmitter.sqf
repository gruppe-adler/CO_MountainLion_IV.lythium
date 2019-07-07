params ["_type", "_position", "_dropRate"];

private _oldEmitterArray = [_type, "old"] call ODE_sandstorm_fnc_getEmitterArray;
private _newEmitterArray = [_type, "new"] call ODE_sandstorm_fnc_getEmitterArray;

private _emitter = _oldEmitterArray deleteAt 0;

// wenn kein emitter vorhanden ist, der gemoved werden kann
if (isNil "_emitter") then {
    // neuen emitter spawnen
    _emitter = [_position, _type] call ODE_sandstorm_fnc_createEmitter;
};

_emitter setPos _position;
_emitter setDropInterval _dropRate;

[_type, "new", _emitter] call ODE_sandstorm_fnc_addToEmitterArray;