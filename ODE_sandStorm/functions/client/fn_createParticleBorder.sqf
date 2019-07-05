//nul = [position, 500,5] execVM "circle.sqf";

params ["_pos", "_radius", "_lengthBetween"];

_pos params ["_px","_py"];

private _allEmitters = missionNamespace getVariable ["sandstormEmittersBorder", []];

private _circ = floor ((2 * pi) * _radius);
private _radials = floor (_circ / _lengthBetween);
private _factor = (360 / _radials);

for "_i" from 0 to (_radials - 1) do 
{ 
    _ix = (_i * _factor);   
    
    _ox = ((_radius - 250) * cos _ix); 
    _oy = ((_radius - 250) * sin _ix); 
    
    private _posX = _px + _ox; 
    private _posY = _py + _oy;
    
    private _emitters = [[_posX, _posY, 0]] call ODE_sandstorm_fnc_createParticleEmitterBorderTop;
    _allEmitters pushBack _emitters;

    _ox = ((_radius - 175)* cos _ix);
    _oy = ((_radius - 175) * sin _ix);
    
    private _posX = _px + _ox; 
    private _posY = _py + _oy;
    private _emitters = [[_posX, _posY, 0]] call ODE_sandstorm_fnc_createParticleEmitterBorderBottom;
    _allEmitters pushBack _emitters;


    _ox = ((_radius - 600)* cos _ix);
    _oy = ((_radius - 600) * sin _ix);
    
    private _posX = _px + _ox; 
    private _posY = _py + _oy;
    private _emitters = [[_posX, _posY, 0]] call ODE_sandstorm_fnc_createParticleFiller;
    _allEmitters pushBack _emitters;
};

missionNamespace setVariable ["sandstormEmittersBorder", _allEmitters];