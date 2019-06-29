waitUntil {!isNull player};
waitUntil {  time > 3 };
if (
  !isNull (getAssignedCuratorLogic player) &&
  {isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")}
) then
{
  // Note that the line below has to be uncommented if your mission is a Zeus Game Master mission.
  // TODO check if below is necessary to uncomment
  waitUntil {not isNil "ares_category_list"};

  ["ATAKA", "Show List of DIE & SPECTATE Players",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    private _spectatorList = missionNameSpace getVariable ["GRAD_permaChoice_spectatorList", []];
    private _stringify = str _spectatorList;
  	["AllSpectators", [_stringify]] call bis_fnc_showNotification;

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Force Respawn everyone here",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    missionNameSpace setVariable ["ATAKA_RespawnPosition", _position, true];
  	[] remoteExec ["GRAD_permaChoice_fnc_forceRespawn", [0,-2] select isDedicated, true];

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Spawn Reinforcements",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	[""] remoteExec ["GRAD_reinforcements_fnc_init", 2];

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Spawn Convoy",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [[
      "mrk_convoy_1",
      "mrk_convoy_2",
      "mrk_convoy_3",
      "mrk_convoy_4",
      "mrk_convoy_5"
    ]] remoteExec ["GRAD_convoy_fnc_start", 2];

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Display Mission End SUCCESS",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [true,true,true] remoteExec ["GRAD_missionControl_fnc_endMission", [0,-2] select isDedicated];

  }] call Ares_fnc_RegisterCustomModule;

   ["ATAKA", "Display Mission End FAIL",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [true,true,true] remoteExec ["GRAD_missionControl_fnc_endMission", [0,-2] select isDedicated];

  }] call Ares_fnc_RegisterCustomModule;




  ["ATAKA", "Create Attack Task",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	[[east,west,independent,civilian],["tsk_attack"],["Ruha angreifen und Feinde werfen.","Ruha angreifen","mrk_ruha"],"mrk_ruha",1,2,true, "attack",true] call BIS_fnc_taskCreate;

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Attack Task Success",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	["tsk_attack", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Attack Task Fail",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	["tsk_attack", "FAILED",true] spawn BIS_fnc_taskSetState;

  }] call Ares_fnc_RegisterCustomModule;




  ["ATAKA", "Create Defend Task",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	[[east,west,independent,civilian],["tsk_defend"],["Ruha verteidigen und Gegenangriff abwehren.","Ruha halten","mrk_ruha"],"mrk_ruha",1,2,true, "defend", true] call BIS_fnc_taskCreate;

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Defend Task Success",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	["tsk_defend", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

  }] call Ares_fnc_RegisterCustomModule;

  ["ATAKA", "Defend Task Fail",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	["tsk_defend", "FAILED",true] spawn BIS_fnc_taskSetState;

  }] call Ares_fnc_RegisterCustomModule;



  ["ATAKA", "Create Nachbesprechung Task",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [[east,west,independent,civilian],["tsk_join"],["Nachbesprechung abhalten.","Nachbesprechung",""],_position,1,2,true, "joinHere",true] call BIS_fnc_taskCreate;

  }] call Ares_fnc_RegisterCustomModule;
};
