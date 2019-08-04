/*
    used to spawn random particles inside sandstorm, not hitting player in best case
*/



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

    drop [
        ["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 6], "", "Billboard", 
        1, 5, _position, [_WindVectorX*10, _WindVectorY*10, 0], 0, 10, 7.9, 0.5, [_size, _size, _size], [
            [0.2, 0.2, 0.1, 0], [0.2, 0.2, 0.1, 0.2], [0.2, 0.2, 0.1, 0]
        ], [0.125], 1, 0, "", "", _emitter];
};