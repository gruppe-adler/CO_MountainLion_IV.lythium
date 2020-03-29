
waitUntil {!isNull player};
waitUntil {  time > 3 };

{

  
    _x addEventHandler ["CuratorGroupPlaced", {
        params ["", "_group"];
        ["GRAD_missionControl_setServerAsOwner", [_group]] call CBA_fnc_serverEvent;

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

            [_x] call GRAD_missionControl_fnc_addApacheDestruction;

        } forEach units _group;
    }];

    _x addEventHandler ["CuratorObjectPlaced", {
        params ["", "_object"];
        

        _object setSkill ["aimingShake", 0.2]; 
        _object setSkill ["aimingSpeed", 0.9]; 
        _object setSkill ["endurance", 0.6]; 
        _object setSkill ["spotDistance", 1]; 
        _object setSkill ["spotTime", 0.9]; 
        _object setSkill ["courage", 1]; 
        _object setSkill ["reloadSpeed", 1]; 
        _object setSkill ["commanding", 1];
        _object setSkill ["general", 1];



        if (_object isKindOf "CAManBase") then {
            if (count units _object == 1) then {
                ["GRAD_missionControl_setServerAsOwner", [group _object]] call CBA_fnc_serverEvent;
                [_object] call GRAD_missionControl_fnc_addApacheDestruction;
            };
        } else {
            if (count crew _object > 1) then {
                ["GRAD_missionControl_setServerAsOwner", [group (crew _object select 0)]] call CBA_fnc_serverEvent;
            };
        };
    }];



  _x addEventHandler ["CuratorWaypointPlaced", {
      params ["_curator", "_group", "_waypointID"];

  if (missionNamespace getVariable ["GRAD_MISSIONCONTROL_ZEUS_AI_CHARGE", false]) then {

        [_group, _waypointID] call GRAD_missionControl_fnc_enableChargeMode;
  };

  }];
} forEach allCurators;




// not used for anything atm
["ML MISSION", "Briefing Done",
{
  BRIEFING_DONE = true; publicVariable "BRIEFING_DONE";

}] call zen_custom_modules_fnc_register;


["ML MUSIC", "Intro Fly Music",
{
  [5, 1] remoteExec ["fadeMusic"];
  ["openingbook"] remoteExec ["playMusic"];

}] call zen_custom_modules_fnc_register;


["ZEUS HELPERS", "Alert enemy AI around here",
{
  // Get all the passed parameters
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLToAGL _position;

  [_position] spawn GRAD_missionControl_fnc_alertUnits;

}] call zen_custom_modules_fnc_register;


["ZEUS HELPERS", "Toggle AI Charge",
{
  private _current = missionNamespace getVariable ["GRAD_MISSIONCONTROL_ZEUS_AI_CHARGE", false];
  missionNamespace setVariable ["GRAD_MISSIONCONTROL_ZEUS_AI_CHARGE", !_current, true];

  hint format ["AI CHARGE: %1", !_current];

}] call zen_custom_modules_fnc_register;


["ML MUSIC", "Outro Music",
{
  [5, 1] remoteExec ["fadeMusic"];
  ["outro"] remoteExec ["playMusic"];
}] call zen_custom_modules_fnc_register;
/*
["ML FX", "Make Suicide Bomber",
{
  // Get all the passed parameters
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  if (isNull _objectUnderCursor) exitWith { hint "no unit selected"; };

  [_objectUnderCursor, 300, 100] remoteExec ["GRAD_ambient_fnc_suicider", 2];

}] call zen_custom_modules_fnc_register;

// for debrief
["ML MISSION", "Force Respawn everyone",
{
  // Get all the passed parameters
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [] remoteExec ["GRAD_permaChoice_fnc_forceRespawn", [0,-2] select isDedicated, true];

}] call zen_custom_modules_fnc_register;

// for debrief
["ZEUS HELPERS", "Create Chair Circle",
{
  // Get all the passed parameters
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  
  private _count = count (playableUnits + switchableUnits) + 2;
  
  // possible chairs
  private _chairs = ["Land_CampingChair_V1_F", _position, _count] call GRAD_missionControl_fnc_createChairCircle;

}] call zen_custom_modules_fnc_register;

// not working as expected
["ZEUS HELPERS", "Drop TFAR Ears",
{
  // Get all the passed parameters
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  
  if (isNull _objectUnderCursor) exitWith {
      hint "Returning TFAR ears to Zeus";
      player setVariable ["TF_fnc_position", nil];
  };
  
  [_objectUnderCursor] call GRAD_missionControl_fnc_dropZeusEars;

}] call zen_custom_modules_fnc_register;
*/


["Mountain Enemies", "Weaponize Vehicle",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  
  if (isNull _objectUnderCursor) exitWith {
      hint "no vehicle selected";
  };
  
  [_objectUnderCursor] call GRAD_missionControl_fnc_weaponizeVehicle;

}] call zen_custom_modules_fnc_register;


