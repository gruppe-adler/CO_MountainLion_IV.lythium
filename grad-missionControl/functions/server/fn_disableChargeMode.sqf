params ["_group"];

{
    _x setskill ["courage",1];
    _x ForceSpeed -1;
    _x allowFleeing 1;
    _x enableAI "Target";
    _x enableAI "Autotarget";
    _x SetUnitPos "AUTO";
    _x enableAI "AUTOCOMBAT";
    _x enableAI "COVER";
    _x enableAI "SUPPRESSION";
    _x enableAI "AUTOCOMBAT";
    _x enableFatigue true;
} forEach units _group;

hint format ["group %1 finished charge", _group];