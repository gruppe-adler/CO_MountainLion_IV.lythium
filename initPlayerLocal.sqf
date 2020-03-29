[] call GRAD_missionControl_fnc_setMyFrequency;
[] call GRAD_missionControl_fnc_addModules;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
player addEventHandler ["HandleRating", {0}];

if ( isMultiplayer &&
     !didJIP) then {
    titleText ["","BLACK FADED",999];
    0 fadeSound 0;

    if (!(typeOf player isEqualTo "B_officer_F") && (!(side player isEqualTo civilian))) then {
        private _myID = player getVariable ["ml_id", 0];
        private _chair = _chairs select _myID;
        [_chair, player] call acex_sitting_fnc_sit;
    };

    if (typeOf player isEqualTo "B_officer_F") then {
        player action ["SwitchWeapon", player, player, 100];
    };
};

if (didJIP) then {
	waitUntil {
	  !isNull player
	};
	sleep 1;
	10 fadeSound 1;
	titleText ["", "BLACK IN", 0];
	player setVariable ["tf_voiceVolume", 1, true];

    if (!(typeOf player isEqualTo "B_officer_F") && (!(side player isEqualTo civilian))) then {
        private _myID = player getVariable ["ml_id", 0];
        private _chair = _chairs select _myID;
        [_chair, player] call acex_sitting_fnc_sit;
    };

    if (typeOf player isEqualTo "B_officer_F") then {
        player action ["SwitchWeapon", player, player, 100];
    };
};