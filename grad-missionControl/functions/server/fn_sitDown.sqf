/*
    [this] call GRAD_missionControl_fnc_sitDown;
*/

params ["_unit"];

if (!isServer) exitWith {}; // we dont want to create 1mio logics

private _group = group _unit;

{
    [
     _x,
     "SIT_LOW",
     "ASIS", {combatMode (group _this) isEqualTo "AWARE"}
    ] call BIS_fnc_ambientAnimCombat;
} forEach units _group;