params ["_trigger", "_triggerSound", "_helperObject", "_sandstormIdentifier"];

private _updateRate = 1;

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

if (!GRAD_SANDSTORM_DEBUG) then {
    _markerstr setMarkerAlphaLocal 0;
};

[_trigger, ((triggerArea _trigger) select 0) - 50, 50, _helperObject, _sandstormIdentifier]  call GRAD_sandstorm_fnc_createParticleBorder;


[{
    params ["_args", "_handle"];
    _args params ["_trigger", "_triggerSound", "_markerstr", "_helperObject", "_sandstormIdentifier", "_updateRate"];

    if (isNull _trigger) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        
        if (GRAD_SANDSTORM_DEBUG) then {
            systemChat "removing local sandwall";
        };
        
        // delete emitter
        ["borderBottom", _sandstormIdentifier] call GRAD_sandstorm_fnc_clearEmitterArray;
        ["fillerSmall", _sandstormIdentifier] call GRAD_sandstorm_fnc_clearEmitterArray;
        ["filler", _sandstormIdentifier] call GRAD_sandstorm_fnc_clearEmitterArray;
    };

    if (GRAD_SANDSTORM_DEBUG) then {
         // debug marker pos
         _markerstr setMarkerPos (getPos vehicle player);
    };

    // 
    ["borderBottom", _helperObject, _sandstormIdentifier] call GRAD_sandstorm_fnc_setEmitterLOD;
    ["fillerSmall", _helperObject, _sandstormIdentifier] call GRAD_sandstorm_fnc_setEmitterLOD;
    ["filler", _helperObject, _sandstormIdentifier] call GRAD_sandstorm_fnc_setEmitterLOD;

    if ((vehicle player) inArea _triggerSound) then {
        if ((player getVariable ["sandStormSoundEH", -1]) == -1) then {
                0 fadeMusic 0;
                playMusic "desertLoop";
                10 fadeMusic 0.5;
                private _soundeffect = addMusicEventHandler ["MusicStop", {
                        playMusic "desertLoop";
                        if (GRAD_SANDSTORM_DEBUG) then {
                            systemChat "restarting sound effect";
                        };
                }];
                player setVariable ["sandStormSoundEH", _soundeffect];
            };
    } else {
        private _soundeffect = player getVariable ["sandStormSoundEH", -1];

        if (_soundeffect > -1) then {
            // stop music
            10 fadeMusic 0;
            [{
                if (!(player getVariable ["isInsideSandstorm", false])) then {
                    playMusic "";

                    removeMusicEventHandler ["MusicStop", _soundeffect];
                    0 fadeMusic 1;
                };
            }, [], 10] call CBA_fnc_waitAndExecute;
    };

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
        private _inBuilding = [_updateRate] call GRAD_sandstorm_fnc_adjustEffects;
        if (!_inBuilding) then {
            [] call GRAD_sandstorm_fnc_createParticleClose;
        };

    } else {
        _updateRate setFog [0.01,0.003,00]; // reset fog
        setAperture -1;

        if (player getVariable ["isInsideSandstorm", false]) then {
            player setVariable ["isInsideSandstorm", false];
            private _pp = player getVariable ["isInsideSandstormPP", []];
            private _leaves = player getVariable ["isInsideSandstormLeaves", []];
            [_pp] call GRAD_sandstorm_fnc_removePostProcessing;

            {
                deleteVehicle _x;
            } forEach _leaves; 
        };
    };
    
}, _updateRate, [_trigger, _triggerSound, _markerstr, _helperObject, _sandstormIdentifier, _updateRate]] call CBA_fnc_addPerFrameHandler;
