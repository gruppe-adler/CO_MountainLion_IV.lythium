/*

[this, "", 5] call GRAD_missionControl_fnc_addIntel;

*/


params ["_object", "_name", ["_duration",12]];

if (isNull _object) exitWith {};

_object setVariable ["Intel_Identifier", _name, true];


[
	_object,											// Object the action is attached to
	"Search",										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3",						// Condition for the action to be shown
	"_caller distance _target < 3",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{[_target] call GRAD_missionControl_fnc_readIntel; },				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	_duration,													// Action duration [s]
	1000,													// Priority
	true,												// Remove on completion
	false												// Show in unconscious state 
] remoteExec ["BIS_fnc_holdActionAdd", 0, _object];	// MP compatible implementation