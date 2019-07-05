params ["_heli"];

_linger = [_heli] call grad_rotorwash_fnc_createLingerEmitter;
_wash = [_heli] call grad_rotorwash_fnc_createWashEmitter;

_heli setVariable ["grad_rotorwash_emittersActive", [_linger, _wash]];

diag_log format ["activating emitters"];