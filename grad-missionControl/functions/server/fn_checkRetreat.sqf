if (!isServer) exitWith {};

[{
	params ["_args", "_handle"];

	if (!(isNull flagOwner flag_retreat)) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;

		diag_log format ["mission end triggered"];

		["TaskSucceeded", ["Rückzug", "Die Russen ziehen sich zurück..."]] remoteExec ["bis_fnc_showNotification", allPlayers];
	};

}, 3, []] call CBA_fnc_addPerFrameHandler;