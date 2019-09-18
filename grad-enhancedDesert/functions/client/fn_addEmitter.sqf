params ["_vehicle"];

if (_vehicle getVariable ["GRAD_enhancedDesert_emitterAdded", false]) exitWith {};
_vehicle setVariable ["GRAD_enhancedDesert_emitterAdded", true];


[{
	params ["_args", "_handle"];
	_args params ["_vehicle", "_lingerEmitter"];

	if (!alive _vehicle) exitWith {
		deleteVehicle _lingerEmitter;
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	private _colorR = 0.3; 
	private _colorG = 0.25; 
	private _colorB = 0.2; 
	private _alpha = 0.3;
	private _lifetime = 60;

	private _speed = speed _vehicle;
	
	if (_speed > 5 && GRAD_enhancedDesert_ACTIVE) then {
		drop ["\A3\data_f\cl_basic", "", "Billboard", 1, _lifetime, position _vehicle, [0, 0, 0], 0.3, 
		 1,
		 1,
		 50,
		 [8, 12, 14, 16, 19, 23, 25, 27, 29, 31, 33, 35, 37, 40], 
		 [
		 	
		 	[_colorR, _colorG, _colorB, 0],
		 	[_colorR, _colorG, _colorB, 0.1],
		 	[_colorR, _colorG, _colorB, 0.07],
		 	[_colorR, _colorG, _colorB, 0.05],
		 	[_colorR, _colorG, _colorB, 0.03],
		 	[_colorR, _colorG, _colorB, 0.02],
		 	[_colorR, _colorG, _colorB, 0.019],
		 	[_colorR, _colorG, _colorB, 0.017],
		 	[_colorR, _colorG, _colorB, 0.015],
		 	[_colorR, _colorG, _colorB, 0.012],
		 	[_colorR, _colorG, _colorB, 0.010],
		 	[_colorR, _colorG, _colorB, 0.005],
		 	[_colorR, _colorG, _colorB, 0.002],
		 	[_colorR, _colorG, _colorB, 0]
		 ], 
		 [0.08], 0, 0, "", "", _vehicle];
	};

}, 1, [_vehicle, _lingerEmitter]] call CBA_fnc_addPerFrameHandler;