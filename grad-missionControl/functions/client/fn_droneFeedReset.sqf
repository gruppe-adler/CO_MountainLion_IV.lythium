private _screen = player getVariable ["GRAD_missionControl_pipScreen", objNull];

_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];

/* create camera and stream to render surface */
private _droneCam = "camera" camCreate [0,0,0];
_droneCam cameraEffect ["Internal", "Back", "uavrtt"];

/* attach cam to gunner cam position */
_droneCam attachTo [stage1_drone, [0,0,0], "commanderview"];

/* make it zoom in a little */
_droneCam camSetFov (_screen getVariable ["GRAD_missionControl_zoomLevel", 0.1]);

/* switch cam to thermal */
"uavrtt" setPiPEffect [_screen getVariable ["GRAD_missionControl_pipEffect", 2]];

player setVariable ["GRAD_missionControl_droneCam", _droneCam];