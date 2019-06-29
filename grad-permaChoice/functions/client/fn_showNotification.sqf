/*

  notification for curator if player switches to DIE & SPECTATE

*/

params ["_name"];

["SpectatorAscending" ,[_name]] call bis_fnc_showNotification;

// add name to list to retreive later on
private _allSpectators = missionNameSpace getVariable ["GRAD_permaChoice_spectatorList", []];
_allSpectators pushback [_name];
missionNameSpace setVariable ["GRAD_permaChoice_spectatorList", _allSpectators];