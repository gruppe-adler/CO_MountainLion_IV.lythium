//nul = [position, 500,5] execVM "circle.sqf";

params ["_pos", "_distance"];

private _allEmitters = missionNamespace getVariable ["sandstormEmittersClose", []];

private _offsets = [
    -80,
    -70,
    -60,
    -50,
    -40,
    -30,
    -20,
    -10,
    0,
    10,
    20,
    30,
    40,
    50,
    60,
    70,
    80
];

for "_i" from 0 to (count _offsets - 1) do 
{ 
    private _offset = _offsets select _i;

    private _position = _pos getPos [_distance, windDir - 180 + _offset];
    _position params ["_posX", "_posY"];

    private _emitters = [[_posX, _posY, 0]] call ODE_sandstorm_fnc_createParticleEmitterClose;
    _allEmitters pushBack _emitters;
};

missionNamespace setVariable ["sandstormEmittersClose", _allEmitters];