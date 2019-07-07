params ["_position", "_type", "_dropRate"];

private _emitter = "#particlesource" createVehicleLocal _position;

private _paramsCircle = [_type] call ODE_sandstorm_fnc_getEmitterParamsCircle;
private _paramsRandom = [_type] call ODE_sandstorm_fnc_getEmitterParamsRandom;
private _paramsGeneral = [_emitter, _type] call ODE_sandstorm_fnc_getEmitterParams;

_emitter setParticleCircle _paramsCircle;
_emitter setParticleRandom _paramsRandom;
_emitter setParticleParams _paramsGeneral;

[_type, "new", _emitter] call ODE_sandstorm_fnc_addToEmitterArray;

_emitter setDropInterval (random _dropRate + _dropRate);