/*

	calculates drop rate

	trigger intersects with trigger

*/


params ["_type", "_helperObject", "_sandstormIdentifier"];


private _LODDefinitions = player getVariable ["ODE_LODTriggerDefinitions", []];
private _LODCount = count _LODDefinitions;

private _arrayOriginal = [_type, _sandstormIdentifier] call ODE_sandstorm_fnc_getEmitterArray;
[_arrayOriginal, _type, _helperObject] call ODE_sandstorm_fnc_moveEmitter;

// systemChat format ["_arrayOriginal %1", _arrayOriginal];
// diag_log format ["_arrayOriginal %1", _arrayOriginal];


private _arrayWorkingCopy = +_arrayOriginal;

for "_i" from 0 to (_LODCount-1) do {
	
	(_LODDefinitions select _i) params ["_triggerSize", "_dropRate"];
	_dropRate params ["_dropRateDefault", "_dropRateFiller"];

	private _triggerIdentifier = format ["ODE_LODTrigger_%1", _i];
	private _trigger = player getVariable [_triggerIdentifier, objNull];
	private _positions = _arrayWorkingCopy inAreaArray _trigger;
	private _positionsForThisLOD = _positions arrayIntersect _arrayWorkingCopy;
	_arrayWorkingCopy = _arrayWorkingCopy - _positionsForThisLOD;

	//systemChat format ["positions %1 in _positionsForThisLOD %2", count _positionsForThisLOD, _i];
	//diag_log format ["positions %1 in _positionsForThisLOD %2", count _positionsForThisLOD, _i];
	{
	  	[_x, [_dropRateDefault, _dropRateFiller] select (_type == "filler")] call ODE_sandstorm_fnc_adjustEmitter;
	} forEach _positionsForThisLOD;
};

if (count _arrayWorkingCopy > 0) then {
	{
		// systemChat "disabling emitter";
	  	_x enableSimulationGlobal false;
	} forEach _arrayWorkingCopy;
};