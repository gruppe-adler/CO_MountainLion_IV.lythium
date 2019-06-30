params ["_object"];

private _intel = _object getVariable ["Intel_Identifier", ""];

if (!(_intel isEqualTo "")) then {
	 [player, ["Diary", ["Intel", _intel]]] remoteExec ["createDiaryRecord", [0,-2] select isDedicated, true];
	 ["IntelFound",["Pashto Writing","Intel found"]] remoteExec ["BIS_fnc_showNotification", [0,-2] select isDedicated, false];
	 private _currentIntelFound = (missionNamespace getVariable ["ML_intelFound", 0]) + 1;
     private _currentIntelCount = missionNamespace getVariable ["ML_intelCount", 0];
     missionNamespace setVariable ["ML_intelFound", _currentIntelFound, true];

     [_object, "AinjPpneMstpSnonWrflDnon"] remoteExec ["switchMove", 0, true];

     diag_log format ["intel found. %1 intel out there, %2 found", _currentIntelCount, _currentIntelFound];

      private _allCuratorUnits = [];
      {
        _allCuratorUnits pushback (getAssignedCuratorUnit _x);
      } forEach allCurators;

      [format ["intel %1 read of total %2", _currentIntelFound, _currentIntelCount]] remoteExec ["systemChat", _allCuratorUnits, true];

} else {
	hint "nothing found";
  [_object, "AinjPpneMstpSnonWrflDnon"] remoteExec ["switchMove", 0, true];
};