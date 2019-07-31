params ["_emitter", "_type", "_helperObject"];

private _emitterIdentifier = format ["GRAD_sandstorm_emitterOffset_%1_%2", _emitter, _type];
private _offset = missionNamespace getVariable [_emitterIdentifier, [0,0]];
_offset params ["_offsetDistance", "_offsetDir"];

// diag_log format ["GRAD_sandstorm_offsetToHelper %1", [_offsetDistance, _offsetDir]];
private _offsetPos = _helperObject getPos [_offsetDistance, _offsetDir];

_offsetPos set [2,0];

_emitter setPos _offsetPos;