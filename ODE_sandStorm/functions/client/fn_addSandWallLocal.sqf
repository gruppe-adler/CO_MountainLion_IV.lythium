params ["_trigger"];

[{
    params ["_args", "_handle"];
    _args params ["_trigger"];

    if (isNull _trigger) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        systemChat "removing local sandwall";
    };


    // systemChat "moving sandwall";
    [] call ODE_sandStorm_fnc_deleteEmitters;

    [getPos _trigger, ((triggerArea _trigger) select 0) - 50, 50]  call ODE_sandStorm_fnc_createParticleBorder;
    [_trigger] call ODE_sandStorm_fnc_createParticleFiller;


    if ((vehicle player) inArea _trigger) then {

        addCamShake [random 0.01 + 0.01, 1, 5 + random 2];

        if (vehicle player isKindOf "Air" && {driver vehicle player == player}) then {
            private _damage = (vehicle player) getHitPointDamage "HitEngine";
            if (_damage < 0.8) then {
                _damage = _damage + 0.02;
                vehicle player setHitPointDamage ["HitEngine", _damage];
            };
        };
        1 setFog [0.1,0.003,500];

        playSound "A3WindFast";

        private _allCloseEmitters = missionNamespace getVariable ["sandstormEmittersClose", []];
        [getPos vehicle player, random 150+100]  call ODE_sandStorm_fnc_createParticleClose;

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
    
}, 1, [_trigger]] call CBA_fnc_addPerFrameHandler;
