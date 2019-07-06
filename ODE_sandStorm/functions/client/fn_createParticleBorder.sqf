//nul = [position, 500,5] execVM "circle.sqf";

params ["_pos", "_radius", "_lengthBetween"];

_pos params ["_px","_py"];

private _allEmitters = missionNamespace getVariable ["sandstormEmittersBorder", []];

private _circ = floor ((2 * pi) * _radius);
private _radials = floor (_circ / _lengthBetween);
private _factor = (360 / _radials);

for "_i" from 0 to (_radials - 1) do 
{ 
    private _ix = (_i * _factor);   
    
    // border top, brighters sands
    private _ox = ((_radius - 250) * cos _ix); 
    private _oy = ((_radius - 250) * sin _ix); 
    
    private _posX = _px + _ox; 
    private _posY = _py + _oy;
    
    private _emitters = [[_posX, _posY, 0]] call ODE_sandstorm_fnc_createParticleEmitterBorderTop;
    _allEmitters pushBack _emitters;


    // border bottom, dark material gets thrown up
    _ox = ((_radius - 175)* cos _ix);
    _oy = ((_radius - 175) * sin _ix);
    
    private _posX = _px + _ox; 
    private _posY = _py + _oy;
    private _emitters = [[_posX, _posY, 0]] call ODE_sandstorm_fnc_createParticleEmitterBorderBottom;
    _allEmitters pushBack _emitters;
};

_lengthBetween = 150;
_circ = floor ((2 * pi) * _radius);
_radials = floor (_circ / _lengthBetween);
_factor = (360 / _radials);

// fillers dont need 50m 

for "_i" from 0 to (_radials - 1) do 
{ 
    private _ix = (_i * _factor);   
    
    
    // big line of fillers simulating dust
    private _ox = ((_radius - 600)* cos _ix);
    private _oy = ((_radius - 600) * sin _ix);
    
    private _posX = _px + _ox; 
    private _posY = _py + _oy;
    private _emitters = [[_posX, _posY, 0]] call ODE_sandstorm_fnc_createParticleFiller;
    _allEmitters pushBack _emitters;

    // 2nd line to fill gaps when you are close
    _ox = ((_radius - 1000)* cos _ix);
    _oy = ((_radius - 1000) * sin _ix);
    
    private _posX = _px + _ox; 
    private _posY = _py + _oy;
    private _emitters = [[_posX, _posY, 0]] call ODE_sandstorm_fnc_createParticleFiller;
    _allEmitters pushBack _emitters;
};

missionNamespace setVariable ["sandstormEmittersBorder", _allEmitters];