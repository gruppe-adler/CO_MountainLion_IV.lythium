params ["_fov", ["_droneCam", objNull]];

private _droneCamInternal = player getVariable ["GRAD_missionControl_droneCamInternal", objNull];

if (isNull _droneCamInternal) then {
    _droneCam camSetFov _fov;
} else {
    _droneCamInternal camSetFov _fov;
    if (!isNull _droneCam) then {
        _droneCam camSetFov _fov;
    };
};