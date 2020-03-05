params ["_effect", "_droneCam"];

private _droneCamInternal = player getVariable ["GRAD_missionControl_droneCamInternal", objNull];

if (isNull _droneCamInternal) then {
    "uavrtt" setPiPEffect [_effect];
} else {
    switch (_effect) do { 
        case 1 : {  camUseNVG true; }; 
        case 2 : {  true setCamUseTI 1; }; 
        default {  camUseNVG false; false SetCamUseTi 0; }; 
    };
    "uavrtt" setPiPEffect [_effect];
};