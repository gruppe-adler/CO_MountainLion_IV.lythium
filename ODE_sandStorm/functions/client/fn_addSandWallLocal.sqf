params ["_trigger", "_helperObject", "_sandstormIdentifier"];


[] call ODE_sandStorm_fnc_addLODTrigger;


/*
    debug
*/

private _markerstr = createMarkerLocal ["mrk_lod",[0,0]]; 
_markerstr setMarkerShapeLocal "ELLIPSE"; 
_markerstr setMarkerColorLocal "ColorBlue"; 
_markerstr setMarkerBrushLocal "Border"; 
_markerstr setMarkerSize [4000,4000]; 
_markerstr setMarkerPos getpos vehicle player;

[_trigger, ((triggerArea _trigger) select 0) - 50, 50, _helperObject, _sandstormIdentifier]  call ODE_sandStorm_fnc_createParticleBorder;

[{
    params ["_args", "_handle"];
    _args params ["_trigger", "_markerstr", "_helperObject", "_sandstormIdentifier"];

    if (isNull _trigger) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        systemChat "removing local sandwall";
    };

    _markerstr setMarkerPos (getPos vehicle player);

    ["borderBottom", _helperObject, _sandstormIdentifier] call ODE_sandStorm_fnc_setEmitterLOD;
    ["borderTop", _helperObject, _sandstormIdentifier] call ODE_sandStorm_fnc_setEmitterLOD;
    ["filler", _helperObject, _sandstormIdentifier] call ODE_sandStorm_fnc_setEmitterLOD;

    if ((vehicle player) inArea _trigger) then {

        addCamShake [random 0.01 + 0.01, 1, 5 + random 2];

        if (vehicle player isKindOf "Helicopter" && {driver vehicle player == player}) then {
            private _damage = (vehicle player) getHitPointDamage "HitEngine";
            if (_damage < 0.8) then {
                _damage = _damage + 0.02;
                vehicle player setHitPointDamage ["HitEngine", _damage];
            };
        };
        1 setFog [0.3 + random 0.5,0,0];

        // playSound ["A3\sounds_f\ambient\winds\wind-synth-fast.wss", player];

        if (!(player getVariable ["isInsideSandstorm", false])) then {
            private _pp = call ODE_sandStorm_fnc_addPostProcessing;
            private _leaves = call ODE_sandStorm_fnc_addLeaves;

            player setVariable ["isInsideSandstorm", true];
            player setVariable ["isInsideSandstormPP", _pp];
            player setVariable ["isInsideSandstormLeaves", _leaves];
        };

    } else {
        1 setFog [0.01,0.003,00];
        if (player getVariable ["isInsideSandstorm", false]) then {
            player setVariable ["isInsideSandstorm", false];
            private _pp = player getVariable ["isInsideSandstormPP", []];
            private _leaves = player getVariable ["isInsideSandstormLeaves", []];
            {
                deleteVehicle _x;
            } forEach _leaves;
            
            [_pp] call ODE_sandStorm_fnc_removePostProcessing;
        };
    };
    
}, 5, [_trigger, _markerstr, _helperObject, _sandstormIdentifier]] call CBA_fnc_addPerFrameHandler;
