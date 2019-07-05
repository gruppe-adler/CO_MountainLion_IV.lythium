private _alpha = 0.6;
private _colorR = [0.4, 0.35, 0.2, 0.2 + random 0.6];
private _colorG = [0.3 + random 0.2, 0.35, 0.2, 0.2 + random 0.6];
private _colorB = [0.3  + random 0.2, 0.35, 0.2, 0.3 + random 0.5];

if (sunOrMoon > 0.5) then {
    _alpha = 0.6;
    _colorR = [0.8, 0.7, 0.4, 0.2 + random 0.6];
    _colorG = [0.6 + random 0.4, 0.7, 0.4, 0.2 + random 0.6];
    _colorB = [0.6  + random 0.4, 0.7 , 0.4, 0.3 + random 0.5];
};

private _rvel = (abs (wind select 0) + abs (wind select 1))/1.5;
private _speed = vectorMagnitude wind;
private _particles = "#particlesource" createVehicleLocal (position player);
_particles setParticleParams [
    ["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard",
     1, 10, [0, 0, 0], 
     _speed, _rvel, 1.275, 1, 1, 
     [5], 
     [
         _colorR + [0], 
         _colorG + [_alpha], 
         _colorB + [0]
     ],
     [1000], 1, 1, "", "", player];
_particles setParticleRandom [3, [100 + (random 8), 100 + (random 10), 20], [2, 2, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
_particles setParticleCircle [0.1, [0,0,0]];
_particles setDropInterval 0.01;