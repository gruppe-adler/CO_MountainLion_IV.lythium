params ["_group", "_waypointID"];

{
    _x setskill ["courage",1];
    _x setCombatMode "RED";
    _x ForceSpeed 10;
    _x allowFleeing 0;
    _x disableAI "Target";
    _x disableAI "Autotarget";
    _x SetUnitPos "UP";
    _x disableAI "AUTOCOMBAT";
    _x disableAI "COVER";
    _x disableAI "SUPPRESSION";
    _x disableAI "AUTOCOMBAT";
    _x enableFatigue false;
} forEach units _group;

[_group, _waypointID] setWaypointStatements ["true", "[group this] call GRAD_missionControl_fnc_disableChargeMode;"];