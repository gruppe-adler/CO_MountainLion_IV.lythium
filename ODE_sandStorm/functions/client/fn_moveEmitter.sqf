params ["_emitter", "_helperObject"];

private _offset = _emitter getVariable ["ODE_sandstorm_offsetToHelper", [0,0]];
private _offsetPos = _helperObject getPos [_offsetDistance, _offsetDir];

_offsetPos set [2,0];

_emitter setPos _offsetPos;