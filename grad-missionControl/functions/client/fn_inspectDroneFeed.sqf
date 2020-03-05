params ["_screen"];
diwako_dui_main_toggled_off = true;
("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];

private _effect = _screen getVariable ["GRAD_missionControl_pipEffect", 2];
private _zoom = _screen getVariable ["GRAD_missionControl_zoomLevel", 0.1];

private _droneCamInternal = "camera" camCreate [0,0,0];
_droneCamInternal cameraEffect ["Internal", "Back"];

/* attach cam to gunner cam position */
_droneCamInternal attachTo [stage1_drone, [0,0,0], "commanderview"];

/* make it zoom in a little */
_droneCamInternal camSetFov _zoom;

/* switch cam to thermal */
switch (_effect) do { 
    case 1 : {  camUseNVG true; }; 
    case 2 : {  true setCamUseTI 0; }; 
    default {  /*...code...*/ }; 
};

player setVariable ["GRAD_missionControl_droneCamInternal", _droneCamInternal];

inGameUISetEventHandler ["PrevAction", "true"];
inGameUISetEventHandler ["NextAction", "true"];

["Mode","Exit","Zoom"] call ace_interaction_fnc_showMouseHint;

private _mouseClickEH = (findDisplay 46) displayAddEventHandler [
      "MouseButtonDown",
      "_this call GRAD_missionControl_fnc_droneFeedinterpretMouseClick"
];
private _mouseWheelEH = (findDisplay 46) displayAddEventHandler [
      "MouseZChanged",
      "_this call GRAD_missionControl_fnc_droneFeedinterpretMouseWheel"
];




private ["_ppGrain"];
_ppGrain = ppEffectCreate ["filmGrain", 2012];
_ppGrain ppEffectEnable true;
_ppGrain ppEffectAdjust [0.2, 1, 1, 0, 1];
_ppGrain ppEffectCommit 0;
player setVariable ["GRAD_missionControl_dronePPEffect", _ppGrain];

("BIS_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];


[{
    [] call ace_interaction_fnc_hideMouseHint;
}, [], 5] call CBA_fnc_waitAndExecute;

[{
    params ["_droneCamInternal"];
    isNull _droneCamInternal
}, {
    params ["_droneCamInternal", "_mouseClickEH", "_mouseWheelEH"];
    (findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _mouseClickEH];
    (findDisplay 46) displayRemoveEventHandler ["MouseZChanged", _mouseWheelEH];

    inGameUISetEventHandler ["PrevAction", "false"];
    inGameUISetEventHandler ["NextAction", "false"];
}, [_droneCamInternal, _mouseClickEH, _mouseWheelEH]] call CBA_fnc_waitUntilAndExecute;