wind params ["_WindVectorX", "_WindVectorY"];

_leaves  = "#particlesource" createVehicleLocal (getpos vehicle player);
_leaves attachto [vehicle player];
_leaves setParticleRandom [0, [10, 10, 7], [4, 4, 5], 2, 0.1, [0, 0, 0, 0.5], 1, 1];
_leaves setParticleCircle [100, [0, 0, 0]];
_leaves setParticleParams [
["\A3\data_f\ParticleEffects\Hit_Leaves\Sticks", 1, 1, 1], "", "SpaceObject", 1, 27, [0,0,0], [_WindVectorX, _WindVectorY, 3], 2, 0.000001, 0.0, 0.1, [0.5 + random 0.5], [[0.68,0.68,0.68,1]], [1.5,1], 13, 13, "", "", vehicle player, 0, true ,1, [[0,0,0,0]]];
_leaves setDropInterval 0.025;

_leaves