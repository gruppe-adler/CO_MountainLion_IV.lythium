params ["_position", "_type", "_dropRate", "_helperObject", "_sandstormIdentifier"];

private _emitter = "#particlesource" createVehicleLocal _position;

diag_log format ["create emitter type: %1", _type];

private _paramsCircle = [_type] call ODE_sandstorm_fnc_getEmitterParamsCircle;
private _paramsRandom = [_type] call ODE_sandstorm_fnc_getEmitterParamsRandom;
private _paramsGeneral = [_emitter, _type] call ODE_sandstorm_fnc_getEmitterParams;

_emitter setParticleCircle _paramsCircle;
_emitter setParticleRandom _paramsRandom;
_emitter setParticleParams _paramsGeneral;

[_type, _sandstormIdentifier, _emitter] call ODE_sandstorm_fnc_addToEmitterArray;

_emitter setDropInterval (_dropRate * 1);
// _emitter attachTo [_helperObject];

private _markerstr = createMarkerLocal [format ["markername%1",_position],_position];
_markerstr setMarkerShapeLocal "ICON";
_markerstr setMarkerTypeLocal "mil_dot";

_emitter enableSimulationGlobal false;

_emitter