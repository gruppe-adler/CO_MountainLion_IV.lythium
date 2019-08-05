params ["_vehicle"];


private _colorR = 0.3; 
private _colorG = 0.25; 
private _colorB = 0.2; 
private _alpha = 0.3;
private _lifetime = 60;

private _dropInterval = 0.1;

private _lingerEmitter = "#particlesource" createVehicleLocal [
	getpos _vehicle select 0,
	getPos _vehicle select 1,
	0
];

_lingerEmitter attachTo [_vehicle];

_lingerEmitter setParticleCircle [0, [0, 0, 0]];
_lingerEmitter setParticleParams [
		["\A3\data_f\cl_basic", 1, 0, 1],
		 "", "Billboard", 1, _lifetime, 
		 [0, 0, 0], 
		 [0, 0, 0], 0.3, 
		 1,
		 1,
		 50, // 100
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
		 [0.08], 0, 0, "", "", _lingerEmitter];


_lingerEmitter setParticleRandom
/*LifeTime*/		[30,
/*Position*/		[5,5,0.1],
/*MoveVelocity*/	[0,0,1],
/*rotationVel*/		0,
/*Scale*/		0.1,
/*Color*/		[0.1,0.05,0.025,0.1],
/*randDirPeriod*/	0.01,
/*randDirIntesity*/	0.03,
/*Angle*/		0];

_lingerEmitter enableSimulation false;
_lingerEmitter setDropInterval 0.1;


[{
	params ["_args", "_handle"];
	_args params ["_vehicle", "_lingerEmitter"];

	if (!alive _vehicle) exitWith {
		deleteVehicle _lingerEmitter;
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	private _speed = speed _vehicle;
	
	if (_speed > 5 && GRAD_enhancedDesert_ACTIVE) then {
		_lingerEmitter setDropInterval (2/_speed);
		_lingerEmitter enableSimulation true;
	} else {
		_lingerEmitter enableSimulation false;
	};

}, 1, [_vehicle, _lingerEmitter]] call CBA_fnc_addPerFrameHandler;