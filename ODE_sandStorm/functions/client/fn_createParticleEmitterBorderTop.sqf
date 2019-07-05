params ["_position"];

private _dropInterval = 0.5;

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

private _sandWall2 = "#particlesource" createVehicleLocal _position;
_sandWall2 setParticleCircle [2,[0,0,0]];
_sandWall2 setParticleRandom [0,[0,0,2],[0,0,0],3,0.5,[0,0,0,0],0,0];
_sandWall2 setParticleParams [
    ["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 5 + random 5, 
    [0,0,0], //position
    [random 2 - random 4,random 2 - random 4,40 + random 40], // move velocity
    2,         // rotation
    10, // weight
    30, // volume
    10, // rubbing
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
_sandWall2 setDropInterval (random _dropInterval + _dropInterval);



[_sandWall2]