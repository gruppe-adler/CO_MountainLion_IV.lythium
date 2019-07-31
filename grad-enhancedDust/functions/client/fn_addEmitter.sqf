params ["_vehicle"];


private _colorR = 0.3; 
private _colorG = 0.25; 
private _colorB = 0.2; 
private _alpha = 0.3;

private _dropInterval = 0.1;

private _lingerEmitter = "#particlesource" createVehicleLocal [
	getpos _vehicle select 0,
	getPos _vehicle select 1,
	0
];

_lingerEmitter setParticleCircle [1, [0, 0, 0]];
_lingerEmitter setParticleParams [
		["\A3\data_f\cl_basic", 1, 0, 1],
		 "", "Billboard", 1, grad_rotorwash_linger_lifetime, 
		 [0, 0, 0], 
		 [0, 0, 0], 0.3, 
		 1,
		 1,
		 50, // 100
		 [8, 12, 14, 16, 19, 23, 24, 25, 26, 27, 28, 29, 30, 30], 
		 [
		 	
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.3],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.27],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.25],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.23],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.21],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.19],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.17],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.15],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.1],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.07],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.05],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.03],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0]
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

_lingerEmitter setDropInterval grad_rotorwash_linger_interval;


[{
	params ["_args", "_handle"];
	_args params ["_vehicle", "_lingerEmitter"];

	if (!alive _vehicle) exitWith {
		deleteVehicle _lingerEmitter;
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	private _speed = speed _vehicle;
	
	if (_speed > 5) then {
		_lingerEmitter enableSimulation true;

		_lingerEmitter setDropInterval (2/_speed);
	} else {
		_lingerEmitter enableSimulation false;
	};

}, 1, [_vehicle, _lingerEmitter]] call CBA_fnc_addPerFrameHandler;