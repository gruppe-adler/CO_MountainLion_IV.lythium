params ["_trigger"];

private _position = getPos _trigger;
private _xPos = 500;
private _yPos = 500;

private _sandWall = "#particlesource" createVehicleLocal _position;
_sandWall setParticleCircle [60,[0.2,-0.5,20]];
_sandWall setParticleRandom [5,[_xPos,_yPos,20],[0,0,0],7,0.5,[0,0,0,0.1],0,0];
_sandWall setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 9, [0,0,0], [0,0,10], 45, 20, 13, 0.1, [35,25,50,70],[[0,0,0,0.5],[0.3,0.2,0.1,0.7],[0.9,0.75,0.6,0.8],[0,0,0,0]],[0.08], 0.1, 0.1, "", "", _sandWall];
_sandWall setDropInterval 0.001;

[{
    params ["_args", "_handle"];
    _args params ["_sandWall", "_trigger"];

    if (isNull _trigger) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        systemChat "removing local sandwall";
    };

    _sandWall setPos (getPos _trigger);

    systemChat "moving sandwall";

    if (player inArea _trigger) then {
        0 setFog [0.23,0.021,60];

        if (isNull (player getVariable ["isInsideSandstorm", objNull])) then {
            private _ps = [player, -1, 0.8, false] call BIS_fnc_sandstorm;
            private _pp = call ODE_sandStorm_fnc_addPostProcessing;

            player setVariable ["isInsideSandstorm", _ps select 0];
            player setVariable ["isInsideSandstorm", _pp];

        };

    } else {
        if (!isNull (player getVariable ["isInsideSandstorm", objNull])) then {
            player setVariable ["isInsideSandstorm", objNull];
            private _pp = player getVariable ["isInsideSandstorm", objNull];
            [_pp] call ODE_sandStorm_fnc_removePostProcessing;
        };
    };
    
}, 0, [_sandWall, _trigger]] call CBA_fnc_addPerFrameHandler;