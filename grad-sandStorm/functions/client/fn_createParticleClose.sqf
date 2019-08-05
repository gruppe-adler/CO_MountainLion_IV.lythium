/*
    used to spawn random particles inside sandstorm, not hitting player in best case
*/

private _existingEmitters = missionNameSpace getVariable ["GRAD_sandstorm_closeEmitters", []];

{
  deleteVehicle _x;
} forEach _existingEmitters;

// leave a gap, so player is not likely to be hit by a particle
private _offsets = [
    -80,
    -70,
    -60,
    -50,
    -40,
    -30,
    30,
    40,
    50,
    60,
    70,
    80
];

private _emitters = [];
private _distance = speed vehicle player * 10;


wind params ["_WindVectorX", "_WindVectorY"];

for "_i" from 0 to (count _offsets - 1) do 
{ 
    private _offset = _offsets select _i;
    private _size = 15 + random 5;

    private _position = _pos getPos [_distance, windDir - 180 + _offset];


    private _emitter = "#particlesource" createVehicleLocal _position;
    _emitter setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 1], 1, 25, 10, 0.01, [_size, _size, _size], [ [0.2, 0.2, 0.1, 0], [0.2, 0.2, 0.1, 0.3], [0.2, 0.2, 0.1, 0], [0.00, 0.00, 0.00, 0.00]  ], [0], 0, 0,"","",""];
    _emitter setDropInterval 0.001;
    _emitter attachTo [player];
    _emitters pushBack _emitter;
};

missionNameSpace setVariable ["GRAD_sandstorm_closeEmitters", _emitters];
