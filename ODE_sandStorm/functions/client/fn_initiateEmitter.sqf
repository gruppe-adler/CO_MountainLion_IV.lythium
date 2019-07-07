/*

	calculates drop rate

*/


params ["_type", "_subtype"];


private _identifier = format ["ODE_sandstormEmitterArray_%1_%2", _type, _subtype];

private _tempArray = [_type, _subtype] call ODE_sandstorm_fnc_getEmitterArray;


private _LODDefinitions = player getVariable ["ODE_LODTriggerDefinitions", []];
private _LODCount = count _LODDefinitions;


for "_i" from 0 to (_LODCount-1) do {

	(_LODDefinitions select _i) params ["_triggerSize", "_dropRate"];

	private _identifier = format ["ODE_LODTrigger_%1", _i];
	private _trigger = player getVariable [_identifier, _trigger];

	// get positions in LOD trigger reach
	// removes positions from existing array
	private _positions = _tempArray inAreaArray _trigger;
	private _positionsForThisLOD = _positions arrayIntersect _tempArray;
	_tempArray = _tempArray - _positionsForThisLOD;

	[_type, "new", _dropRate] call ODE_sandstorm_fnc_moveEmitter;

};