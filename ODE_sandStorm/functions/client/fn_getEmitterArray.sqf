params ["_type", "_age"];

private _identifier = format ["ODE_sandstormEmitterArray_%1_%2", _type, _age];

// return value
missionNamespace getVariable [_identifier, []]