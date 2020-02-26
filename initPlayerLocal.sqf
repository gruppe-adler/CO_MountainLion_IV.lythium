if ( isMultiplayer &&
     !didJIP) then {
    titleText ["","BLACK FADED",999];
    0 fadeSound 0;
};

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
player addEventHandler ["HandleRating", {0}];

[] call GRAD_missionControl_fnc_setMyFrequency;
[] call GRAD_missionControl_fnc_addModules;

if (didJIP) then {
	waitUntil {
	  !isNull player
	};
	sleep 1;
	10 fadeSound 1;
	titleText ["", "BLACK IN", 0];
	player setVariable ["tf_voiceVolume", 1, true];
};