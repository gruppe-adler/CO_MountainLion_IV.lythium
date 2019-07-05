/*
    by nomisum
*/

// MAIN LOOP
_loop = [{
    params ["_args", "_handle"];
    _args params [];

    if (call grad_rotorwash_fnc_isActive) then {
        diag_log format ["is active"];

        _point = [vehicle player] call grad_rotorwash_fnc_getWashOrigin;

        [_washEmitter, _lingerEmitter, _point] call grad_rotorwash_fnc_adjustParams;

    } else {
        diag_log format ["hidden"];

        [_washEmitter] call grad_rotorwash_fnc_hideEmitter;
    };

    // placeholder
    if (false) exitWith {
    	[_handle] call CBA_fnc_removePerFrameHandler;
    };
   
},0.5,[]] call CBA_fnc_addPerFrameHandler;