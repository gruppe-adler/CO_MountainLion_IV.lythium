// dont display for JIP
if (didJIP) exitWith {};
waitUntil {!isNull player};
waitUntil {time > 0};
player setVariable ["tf_voiceVolume", 0, true];
diwako_dui_main_toggled_off = true;
showChat false;

if (isMultiplayer) then {

    private _chairs = [
        chair_1,chair_2,chair_3,chair_4,chair_5,chair_6,chair_7,chair_8,chair_9,chair_10,chair_11,chair_12,chair_13,chair_14,chair_15,chair_16,chair_17,chair_18,chair_19,chair_20,chair_21,chair_22,chair_23,chair_24,chair_25,chair_26,chair_27,chair_28,chair_29,chair_30,chair_31,chair_32,chair_33,chair_34,chair_35,chair_36
    ];

    if (!(typeOf player isEqualTo "B_officer_F") && (!(side player isEqualTo civilian))) then {
        private _myID = player getVariable ["ml_id", 0];
        private _chair = _chairs select _myID;
        [_chair, player] call acex_sitting_fnc_sit;
    };

    if (typeOf player isEqualTo "B_officer_F") then {
        player action ["SwitchWeapon", player, player, 100];
    };
};

private _viewDistanceCache = viewDistance;
private _objectViewDistanceCache = getObjectViewDistance;

setViewDistance 8000;
setObjectViewDistance [4000,200];

[] spawn GRAD_introCam_fnc_textEffects;
// [] spawn GRAD_introCam_fnc_playRecord;

private _shots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

private _count = count _shots;
{
  	[_x, _forEachIndex] call GRAD_introCam_fnc_camCommands;
} forEach _shots;


cutText [" ", "BLACK IN", 3];
private _camera = "camera" camCreate (getpos player);
_camera cameraeffect ["terminate", "back"];
camDestroy _camera;

STHud_UIMode = 1;

setViewDistance _viewDistanceCache;
setObjectViewDistance _objectViewDistanceCache;
10 fadeSound 1;
titleText ["", "BLACK IN", 0];
player setVariable ["tf_voiceVolume", 1, true];
diwako_dui_main_toggled_off = false;
showChat true;