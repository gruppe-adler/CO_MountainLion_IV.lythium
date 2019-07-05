params ["_position"];

private _dropInterval = 1;

private _distanceToPlayer = _position distance player;

if (_distanceToPlayer > 5000) exitWith {};

if (_distanceToPlayer > 2000) then {
    _dropInterval = 8;
} else {
    if (_distanceToPlayer > 1000) then {
            _dropInterval = 7;
        } else {
            if (_distanceToPlayer > 800) then {
                _dropInterval = 5;
            };
        };
};

private _dustSize = 120;

private _sandWall = "#particlesource" createVehicleLocal _position;
_sandWall setParticleCircle [0,[0,0,0]];
_sandWall setParticleRandom [5,[100,100,0],[0,0,0],10,0.5,[0.1,0.1,0.1,0.1],0,0];
_sandWall setParticleParams [
    ["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 7, 
    [0,0,-100], //position
    [0,0,150], // move velocity
    60,         // rotation
    70, // weight
    13, // volume
    0.001, // rubbing
    [
        _dustSize*3,
        _dustSize*3.2,
        _dustSize*3.3,
        _dustSize*3.4,
        _dustSize*3.5,
        _dustSize*4
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
    0.1, "", "", _sandWall];
_sandWall setDropInterval 0.5;

[_sandWall]