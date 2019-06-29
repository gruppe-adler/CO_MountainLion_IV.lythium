/*
	prepare ace spec
*/

[[0,1,2], []] call ace_spectator_fnc_updateCameraModes; // no free cam
[[-2,-1], [0,1,2,3,4,5,6,7]] call ace_spectator_fnc_updateVisionModes; // no thermal
[0, player] call ace_spectator_fnc_setCameraAttributes; // center on player
[[west,east,independent,civilian], []] call ace_spectator_fnc_updateSides; // all sides

[true] call ace_spectator_fnc_setSpectator; // launch spec
[player, true] call TFAR_fnc_forceSpectator; // force tfar spec

private _allCuratorUnits = [];

{
    _allCuratorUnits pushback (getAssignedCuratorUnit _x);
} forEach allCurators;

[name player] remoteExec ["GRAD_permaChoice_fnc_showNotification", _allCuratorUnits, true];
