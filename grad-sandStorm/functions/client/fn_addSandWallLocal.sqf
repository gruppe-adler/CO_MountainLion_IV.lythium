params ["_trigger", "_helperObject", "_sandstormIdentifier"];

private _updateRate = 5;

[] call GRAD_sandstorm_fnc_addLODTrigger;


/*
    debug
*/

private _markerstr = createMarkerLocal ["mrk_lod",[0,0]]; 
_markerstr setMarkerShapeLocal "ELLIPSE"; 
_markerstr setMarkerColorLocal "ColorBlue"; 
_markerstr setMarkerBrushLocal "Border"; 
_markerstr setMarkerSize [4000,4000]; 
_markerstr setMarkerPos getpos vehicle player;

[_trigger, ((triggerArea _trigger) select 0) - 50, 50, _helperObject, _sandstormIdentifier]  call GRAD_sandstorm_fnc_createParticleBorder;


[{
    params ["_args", "_handle"];
    _args params ["_trigger", "_markerstr", "_helperObject", "_sandstormIdentifier", "_updateRate"];

    if (isNull _trigger) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        systemChat "removing local sandwall";
    };

    _markerstr setMarkerPos (getPos vehicle player);

    ["borderBottom", _helperObject, _sandstormIdentifier] call GRAD_sandstorm_fnc_setEmitterLOD;
    ["fillerSmall", _helperObject, _sandstormIdentifier] call GRAD_sandstorm_fnc_setEmitterLOD;
    ["filler", _helperObject, _sandstormIdentifier] call GRAD_sandstorm_fnc_setEmitterLOD;

    if ((vehicle player) inArea _trigger) then {

        // playSound ["A3\sounds_f\ambient\winds\wind-synth-fast.wss", player];

        if (!(player getVariable ["isInsideSandstorm", false])) then {
            private _pp = call GRAD_sandstorm_fnc_addPostProcessing;
            private _leaves = call GRAD_sandstorm_fnc_addLeaves;

            player setVariable ["isInsideSandstorm", true];
            player setVariable ["isInsideSandstormPP", _pp];
            player setVariable ["isInsideSandstormLeaves", _leaves];
        };

        [_updateRate] call GRAD_sandstorm_fnc_adjustFog;
        [_updateRate] call GRAD_sandstorm_fnc_adjustEffects;

    } else {
        _updateRate setFog [0.01,0.003,00];
        if (player getVariable ["isInsideSandstorm", false]) then {
            player setVariable ["isInsideSandstorm", false];
            private _pp = player getVariable ["isInsideSandstormPP", []];
            private _leaves = player getVariable ["isInsideSandstormLeaves", []];
            {
                deleteVehicle _x;
            } forEach _leaves;
            
            [_pp] call GRAD_sandstorm_fnc_removePostProcessing;
        };
    };
    
}, _updateRate, [_trigger, _markerstr, _helperObject, _sandstormIdentifier, _updateRate]] call CBA_fnc_addPerFrameHandler;
