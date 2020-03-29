// setDate [2015, 06, 06, 5.5, 0];


["Initialize", [true]] call BIS_fnc_dynamicGroups;


if (isMultiplayer) then {
	[] spawn GRAD_introCam_fnc_init;
} else {
    // [] spawn GRAD_introCam_fnc_init;
};


// [["mrk_ied_1", "mrk_ied_2", "mrk_ied_3"], 3, true] call GRAD_ambient_fnc_ied;

{ 
    _x setSkill ["aimingShake", 0.2]; 
    _x setSkill ["aimingSpeed", 0.9]; 
    _x setSkill ["endurance", 0.6]; 
    _x setSkill ["spotDistance", 1]; 
    _x setSkill ["spotTime", 0.9]; 
    _x setSkill ["courage", 1]; 
    _x setSkill ["reloadSpeed", 1]; 
    _x setSkill ["commanding", 1];
    _x setSkill ["general", 1];

    // [_x] call GRAD_missionControl_fnc_addApacheDestruction;

} forEach (allUnits - switchableUnits - playableUnits);

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];
    diag_log ["HandleDisconnect",_this];
    _unit == zuluPilot
}];


[{
    private _chairs = [];

    for "_i" from 1 to 64 do {
        private _varName = format ["chair_%1", _i];
        _chairs pushBackUnique (call compile _varName);
    };

    {   

        if (_forEachIndex < (count _chairs) - 1) then {

            private _chair = _chairs select _forEachIndex;

            if (!((typeOf _x) isEqualTo "B_Officer_F") && (!((side _x) isEqualTo civilian))) then {
                _x setVariable ["ml_id", _forEachIndex, true];
            };

            if (!isPlayer _x) then {
                [_chair, _x] call acex_sitting_fnc_sit;
            };

        };

    } forEach (playableUnits + switchableUnits);

}, 2] call CBA_fnc_waitAndExecute;