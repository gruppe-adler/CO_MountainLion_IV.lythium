params ["_screen"];

if (isServer) then {
    _screen setVariable ["GRAD_missionControl_pipEffect", 2, true];
    _screen setVariable ["GRAD_missionControl_zoomLevel", 0.1, true];
};

if (hasInterface) then {
    player setVariable ["GRAD_missionControl_pipScreen", _screen];
    [] call GRAD_missionControl_fnc_droneFeedReset;      
    
    if (!(player getVariable ["GRAD_missionControl_droneInit", false])) then {
    
        player setVariable ["GRAD_missionControl_droneInit", true];

        ["cameraView", {
            params ["_unit", "_newCamera"];
            systemChat str "Camera changed.";
            [] call GRAD_missionControl_fnc_droneFeedReset;  
        }, true] call CBA_fnc_addPlayerEventHandler;

        /* adjust cam orientation */
        addMissionEventHandler ["Draw3D", {
            private _droneCam = player getVariable ["GRAD_missionControl_droneCam", objNull];
            private _droneCamInternal = player getVariable ["GRAD_missionControl_droneCamInternal", objNull];
            if (!isNull _droneCamInternal)  then {
                private _dir = 
                    (stage1_drone selectionPosition "laserstart") 
                        vectorFromTo 
                    (stage1_drone selectionPosition "commanderview");
                _droneCamInternal setVectorDirAndUp [
                    _dir, 
                    _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
                ];
            } else {
                private _dir = 
                    (stage1_drone selectionPosition "laserstart") 
                        vectorFromTo 
                    (stage1_drone selectionPosition "commanderview");
                _droneCam setVectorDirAndUp [
                    _dir, 
                    _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
                ];
            };
        }];


        private _action = ["ZoomIn", "Zoom In", "\A3\ui_f\data\igui\cfg\actions\arrow_down_gs.paa", {
            params ["_target", "_player", "_args"];
            _args params ["_droneCam"];
            
             private _currentFOV =  _target getVariable ["GRAD_missionControl_zoomLevel", 0.1];
            _currentFOV = _currentFOV - 0.05;
            [_currentFOV, _droneCam] remoteExec ["GRAD_missionControl_fnc_adjustDroneFOV", [0,-2] select isDedicated];
            _target setVariable ["GRAD_missionControl_zoomLevel", _currentFOV, true];
        }, {
             true
        }, nil, [_droneCam]] call ace_interact_menu_fnc_createAction;
        [_screen, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

        private _action = ["ZoomOut", "Zoom Out", "\A3\ui_f\data\igui\cfg\actions\arrow_up_gs.paa", {
            params ["_target", "_player", "_args"];
            _args params ["_droneCam"];
            
            private _currentFOV =  _target getVariable ["GRAD_missionControl_zoomLevel", 0.1];
            _currentFOV = _currentFOV + 0.05;
            [_currentFOV, _droneCam] remoteExec ["GRAD_missionControl_fnc_adjustDroneFOV", [0,-2] select isDedicated];
            _target setVariable ["GRAD_missionControl_zoomLevel", _currentFOV, true];
        }, {
             true
        }, nil, [_droneCam]] call ace_interact_menu_fnc_createAction;
        [_screen, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

        private _action = ["CycleCamModes","Cycle Cam Modes", "\A3\ui_f\data\igui\cfg\actions\RadarOn_ca.paa", {
            params ["_target", "_player", "_args"];
            
            private _currentEffect = _target getVariable ["GRAD_missionControl_pipEffect", 2];
            _currentEffect = if (_currentEffect < 2) then { _currentEffect + 1 } else { 0 };
            [_currentEffect] remoteExec ["GRAD_missionControl_fnc_adjustDronePipEffect", [0,-2] select isDedicated];
            _target setVariable ["GRAD_missionControl_pipEffect", _currentEffect, true];
        }, {
             true
        }, nil, []] call ace_interact_menu_fnc_createAction;
        [_screen, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

        private _action = ["InspectFeed","Inspect Drone Feed", "\A3\ui_f\data\igui\cfg\actions\RadarOff_ca.paa", {
            params ["_target", "_player", "_args"];

            [_target] call GRAD_missionControl_fnc_inspectDroneFeed;
        }, {
             true
        }, nil, []] call ace_interact_menu_fnc_createAction;
        [_screen, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
    };
};