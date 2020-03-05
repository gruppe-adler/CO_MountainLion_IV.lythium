private _droneCamInternal = player getVariable ["GRAD_missionControl_droneCamInternal", objNull];

if (isNull _droneCamInternal) exitWith {};

if ((_this select 1) == 0) then {
    private _target = player getVariable ["GRAD_missionControl_pipScreen", objNull];
    private _currentEffect = _target getVariable ["GRAD_missionControl_pipEffect", 2];
    _currentEffect = if (_currentEffect < 2) then { _currentEffect + 1 } else { 0 };
    [_currentEffect] remoteExec ["GRAD_missionControl_fnc_adjustDronePipEffect", [0,-2] select isDedicated];
    _target setVariable ["GRAD_missionControl_pipEffect", _currentEffect, true];
};

if ((_this select 1) == 1) then {
    private _camera = "camera" camCreate (getpos player);
    _camera cameraeffect ["terminate", "back"];
    camDestroy _camera;
    camDestroy _droneCamInternal;
    diwako_dui_main_toggled_off = false;

    ("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
    {
        private ["_layer"];
        _layer = _x call BIS_fnc_rscLayer;
        _layer cutText ["", "PLAIN"];
    } forEach ["BIS_layerEstShot", "BIS_layerStatic"];

    private _ppGrain = player getVariable ["GRAD_missionControl_dronePPEffect", -1];
    if (_ppGrain != -1) then {
        ppEffectDestroy _ppGrain;
    };
};