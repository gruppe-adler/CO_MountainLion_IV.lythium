params ["_position"];

private _dropInterval = 0.3;

private _distanceToPlayer = _position distance player;

if (_distanceToPlayer > 5000) exitWith {};

if (_distanceToPlayer > 2500) then {
    _dropInterval = 7;
} else {
    if (_distanceToPlayer > 1000) then {
            _dropInterval = 5;
        } else {
        if (_distanceToPlayer > 800) then {
            _dropInterval = 4;
        } else {
            if (_distanceToPlayer > 600) then {
                _dropInterval = 2;
            } else {
                if (_distanceToPlayer > 400) then {
                    _dropInterval = 1;
                };
            };
        };
    };
};

private _sandWall = "#particlesource" createVehicleLocal _position;
_sandWall setParticleCircle [2,[0,0,0]];
_sandWall setParticleRandom [0,[0,0,2],[0,0,0],3,0.5,[0,0,0,0],0,0];
_sandWall setParticleParams [
    ["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 7, 
    [0,0,0], //position
    [0,0,40 + random 100], // move velocity
    random 5,         // rotation
    25, // weight
    30, // volume
    10, // rubbing
    [
        15,
        17,
        19,
        21,
        25,
        30
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

_sandWall setDropInterval (random _dropInterval + _dropInterval);

[_sandWall]