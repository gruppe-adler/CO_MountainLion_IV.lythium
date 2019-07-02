params ["_trigger"];

private _position = getPos _trigger;
private _xPos = 10;
private _yPos = 10;
(triggerArea _trigger) params ["_trigA", "_trigB", "_angle", "_isRectangle", "_trigC"];

/*
private _sandWall = "#particlesource" createVehicleLocal _position;
_sandWall setParticleCircle [_trigA*2,[0.2,-0.5,20]];
_sandWall setParticleRandom [5,[_xPos,_yPos,20],[0,0,0],10,0.5,[0.1,0.1,0.1,0.1],0,0];
_sandWall setParticleParams [
    ["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 18, 
    [0,0,0], //position
    [0,0,120], // move velocity
    60,         // rotation
    70, // weight
    13, // volume
    0.1, // rubbing
    [
        70,
        80,
        90,
        100,
        120,
        150
    ],
    [
        [0,0,0,0.9],
        [0.3,0.2,0.1,0.9],
        [0.9,0.75,0.6,0.8],
        [0.95,0.8,0.7,0.8],
        [0.9,0.8,0.65,0.7],
        [0.95,0.9,0.85,0]
    ],
    [0.08], 
    0.1, 
    0.1, "", "", _sandWall];
_sandWall setDropInterval 0.01;
*/

private _sandWall = "#particlesource" createVehicleLocal _position;
_sandWall setParticleCircle [_trigA*2,[0.2,-0.5,0]];
_sandWall setParticleRandom [0,[0,0,0],[0,0,0],3,0.5,[0,0,0,0],0,0];
_sandWall setParticleParams [
    ["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 7, 
    [0,0,0], //position
    [0,0,20], // move velocity
    60,         // rotation
    10, // weight
    13, // volume
    0.1, // rubbing
    [
        10,
        30,
        85,
        90,
        95,
        100
    ],
    [
        [0,0,0,0],
        [0.1,0.1,0.1,0.8],
        [0.15,0.15,0.15,0.8],
        [0.2,0.2,0.15,0.7],
        [0.4,0.3,0.2,0.6],
        [0.5,0.4,0.3,0]
    ],
    [0.08], 
    0.1, 
    0.1, "", "", _sandWall];
_sandWall setDropInterval 0.001;


private _sandWall2 = "#particlesource" createVehicleLocal _position;
_sandWall2 setParticleCircle [_trigA*2,[0.2,-0.5,0]];
_sandWall2 setParticleRandom [0,[0,0,0],[0,0,0],3,0.5,[0,0,0,0],0,0];
_sandWall2 setParticleParams [
    ["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 10, 
    [0,0,0], //position
    [0,0,20], // move velocity
    60,         // rotation
    25, // weight
    13, // volume
    0.1, // rubbing
    [
        10,
        45,
        55,
        65,
        75,
        85
    ],
    [
        [0,0,0,0],
        [0,0,0,0.9],
        [0.05,0.05,0.05,0.9],
        [0.1,0.1,0.1,0.9],
        [0.3,0.2,0.2,0.7],
        [0.5,0.4,0.3,0]
    ],
    [0.08], 
    0.1, 
    0.1, "", "", _sandWall2];
_sandWall2 setDropInterval 0.001;

private _sandWall3 = "#particlesource" createVehicleLocal _position;
_sandWall3 setParticleCircle [(_trigA*2)-400,[0.2,-0.5,20]];
_sandWall3 setParticleRandom [5,[200,200,20],[0,0,0],10,0.5,[0.1,0.1,0.1,0.1],0,0];
_sandWall3 setParticleParams [
    ["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 4, 
    [0,0,0], //position
    [0,0,120], // move velocity
    60,         // rotation
    70, // weight
    13, // volume
    0.1, // rubbing
    [
        450,
        450,
        450,
        450,
        450,
        450
    ],
    [
        [0,0,0,0],
        [0.3,0.2,0.1,0.1],
        [0.9,0.75,0.6,0.4],
        [0.95,0.8,0.7,0.5],
        [0.9,0.8,0.65,0.4],
        [0.95,0.9,0.85,0]
    ],
    [0.08], 
    0.1, 
    0.1, "", "", _sandWall3];
_sandWall3 setDropInterval 0.01;

[{
    params ["_args", "_handle"];
    _args params ["_sandWall", "_sandWall2", "_sandWall3", "_trigger"];

    if (isNull _trigger) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        systemChat "removing local sandwall";
    };

    _sandWall setPos (getPos _trigger);
    _sandWall2 setPos (getPos _trigger);
    _sandWall3 setPos (getPos _trigger);

    systemChat "moving sandwall";

    if (player inArea _trigger) then {
        0 setFog [0.23,0.021,60];

        if (isNull (player getVariable ["isInsideSandstorm", objNull])) then {
            private _ps = [player, -1, 0.8, false] call BIS_fnc_sandstorm;
            private _pp = call ODE_sandStorm_fnc_addPostProcessing;
            private _leaves = call ODE_sandStorm_fnc_addLeaves;

            player setVariable ["isInsideSandstorm", _ps select 0];
            player setVariable ["isInsideSandstormPP", _pp];
            player setVariable ["isInsideSandstormLeaves", _leaves];

        };

    } else {
        if (!isNull (player getVariable ["isInsideSandstorm", objNull])) then {
            player setVariable ["isInsideSandstorm", objNull];
            private _pp = player getVariable ["isInsideSandstormPP", -1];
            private _leaves = player getVariable ["isInsideSandstormLeaves", objNull];
            deleteVehicle _leaves;
            [_pp] call ODE_sandStorm_fnc_removePostProcessing;
        };
    };
    
}, 0, [_sandWall, _sandWall2, _sandWall3, _trigger]] call CBA_fnc_addPerFrameHandler;
