/*

	["borderBottom", "new", _emitter] call ODE_sandstorm_fnc_addToEmitterArray;

*/

params ["_type", "_age", "_value"];

private _identifier = format ["ODE_sandstormEmitterArray_%1_%2", _type, _age];

private _existingArray = [_type, _age] call ODE_sandstorm_fnc_getEmitterArray;

_existingArray pushBack _value;
// set value
missionNamespace setVariable [_identifier, _existingArray];