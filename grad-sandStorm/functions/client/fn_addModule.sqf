/*

module for ZEN

0: Values that can be returned <ARRAY>
1: Corresponding pretty names (see below) <ARRAY>
2: Default index <NUMBER>

*/

["GRAD Sandstorm", "Sandstorm Parameters", {

		["GRAD Sandstorm", [
		    [
		    	"COMBO", 
		    	["Sandstorm ID", "Which sandstorm values below are attributed to"], [
		    	[
		    		1,2,3,4,5,6,7,8,9
		    	], [
		        	["1", "Sandstorm 1"],
		        	["2", "Sandstorm 2"],
		        	["3", "Sandstorm 3"],
		        	["4", "Sandstorm 4"],
		        	["5", "Sandstorm 5"],
		        	["6", "Sandstorm 6"],
		        	["7", "Sandstorm 7"],
		        	["8", "Sandstorm 8"],
		        	["9", "Sandstorm 9"]
		    ], 0], true],
		    [
		        "SLIDER",
		        ["Sandstorm Speed", "0 - 50 kmh recommended"],
		        [0, 120, 50, 1],
		        true
		    ],
		    [
		        "SLIDER",
		        ["Sandstorm Direction", "Direction Sandstorm is moving"],
		        [0, 360, windDir, {format ["%1 %", round _this]}],
		        true
		    ]
		], {
		    params ["_dialogValues"];

		    _dialogValues params [
		        "_id",
		        "_speed",
		        "_windDirection"
		    ];
		    
		    ["GRAD_sandstorm_parametersEdited", [_id, _speed, _windDirection]] call CBA_fnc_globalEvent;
		}] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;


["GRAD Sandstorm", "Sandstorm Direction", {

	hint str _this
}] call zen_custom_modules_fnc_register;

["GRAD Sandstorm", "Start Sandstorm", {

	hint str _this
}] call zen_custom_modules_fnc_register;