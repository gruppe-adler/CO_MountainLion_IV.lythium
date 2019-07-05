params ["_position"];

private _dropInterval = 0.1;

private _sandWall = "#particlesource" createVehicleLocal _position;
_sandWall setParticleCircle [5,[0,0,0]];
_sandWall setParticleRandom [0,[0,0,2],[0,0,0],1,0.5,[0,0,0,0],0,0];
_sandWall setParticleParams [
    ["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 6,
    [0,0,-35], //position
    [0,0,-10], // move velocity
    1,         // rotation
    20, // weight
    30, // volume
    40, // rubbing
    [
        50,
        50,
        50,
        50,
        50,
        50
    ],
    [
        [0,0,0,0],
        [0.01,0.01,0.01,0.1],
        [0.05,0.05,0.05,0.2],
        [0.02,0.02,0.15,0.1],
        [0.02,0.02,0.15,0.1],
        [0.02,0.02,0.15,0]
    ],
    [0.8], 
    0.1, 
    0.1, "", "", _sandWall];
_sandWall setDropInterval (random _dropInterval + _dropInterval);

[_sandWall]