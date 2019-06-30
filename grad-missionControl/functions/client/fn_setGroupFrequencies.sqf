// obj , number

/*

// in group leader init
[this, "Alpha", ["60", "60.1", "50"]] call GRAD_missionControl_fnc_setGroupFrequencies;

*/

params ["_unit", "_callsign", ["_frequency", ["40", "40", "40"]]];

if (!isServer) exitWith {};

_frequency params ["_frequencySW", "_frequencySWAdditional", "_frequencyLR"];

{
	_x setVariable ["GRAD_missionControl_frequencySW", _frequencySW, true];
	_x setVariable ["GRAD_missionControl_frequencySWAdditional", _frequencySWAdditional, true];
	_x setVariable ["GRAD_missionControl_frequencyLR", _frequencyLR, true];

} forEach units group _unit;

private _data = [nil, _callsign, false];
["RegisterGroup", [group _unit, _unit, _data]] call BIS_fnc_dynamicGroups;