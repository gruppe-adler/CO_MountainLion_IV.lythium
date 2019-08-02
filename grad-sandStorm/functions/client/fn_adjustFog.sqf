params ["_duration"];

private _fog = missionNamespace getVariable ["GRAD_sandstorm_fogValue", [0,0,0]];

_duration setFog _fog;