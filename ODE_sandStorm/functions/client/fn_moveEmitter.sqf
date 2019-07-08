params ["_type", "_position", "_dropRate", "_helperObject"];


private _emitter = [_position, _type, _dropRate] call ODE_sandstorm_fnc_createEmitter;

_emitter setPos _position;
_emitter setDropInterval _dropRate;
_emitter attachTo [_helperObject];

private _markerstr = createMarkerLocal [format ["markername%1",_position],_position];
_markerstr setMarkerShapeLocal "ICON";
_markerstr setMarkerTypeLocal "mil_dot";