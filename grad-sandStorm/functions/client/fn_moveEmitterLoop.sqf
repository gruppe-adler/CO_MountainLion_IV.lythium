params ["_type", "_sandstormIdentifier", "_helperObject"];

private _arrayOriginal = [_type, _sandstormIdentifier] call GRAD_sandstorm_fnc_getEmitterArray;

private _count = 0;

while {true} do {
    {
        [_x, _type, _helperObject] call GRAD_sandstorm_fnc_moveEmitter;
        sleep 0.01;
    } forEach _arrayOriginal;
    _count = _count + 1;

    // systemChat ("count: " + str _count);
};