private _location = createLocation [ "NameLocal" , position intro_march2, 1000, 1000]; 
_location setText "NATO Basis Kandahar";


STHud_UIMode = 0;

preloadCamera (position muezzin);
preloadCamera (position intro_billboard);

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