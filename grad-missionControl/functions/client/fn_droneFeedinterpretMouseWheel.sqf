private _target = player getVariable ["GRAD_missionControl_pipScreen", objNull];

if (isNull _target) exitWith {};

if ((_this select 1) > 1) then {
   private _currentFOV =  _target getVariable ["GRAD_missionControl_zoomLevel", 0.1];
    _currentFOV = _currentFOV - 0.05;
    [_currentFOV, _droneCam] remoteExec ["GRAD_missionControl_fnc_adjustDroneFOV", [0,-2] select isDedicated];
    _target setVariable ["GRAD_missionControl_zoomLevel", _currentFOV, true];
};
if ((_this select 1) < -1) then {
    private _currentFOV =  _target getVariable ["GRAD_missionControl_zoomLevel", 0.1];
    _currentFOV = _currentFOV + 0.05;
    [_currentFOV, _droneCam] remoteExec ["GRAD_missionControl_fnc_adjustDroneFOV", [0,-2] select isDedicated];
    _target setVariable ["GRAD_missionControl_zoomLevel", _currentFOV, true];
};