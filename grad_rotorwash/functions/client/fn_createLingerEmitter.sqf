params ["_heli"];

private _color = _heli getVariable ["grad_rotorwash_colors", [0,0,0]];
_color params ["_grad_colorR", "_grad_colorG", "_grad_ColorB"];

private _grad_linger = "#particlesource" createVehicleLocal [
	getpos _heli select 0,
	getPos _heli select 1,
	0
];  

_grad_linger setParticleCircle [10, [0, 0, 0]];
_grad_linger setParticleParams [
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
		 [0.08], 0, 0, "", "", _grad_linger];


_grad_linger setParticleRandom
/*LifeTime*/		[30,
/*Position*/		[5,5,0.1],
/*MoveVelocity*/	[0,0,1],
/*rotationVel*/		0,
/*Scale*/		0.1,
/*Color*/		[0.1,0.05,0.025,0.1],
/*randDirPeriod*/	0.01,
/*randDirIntesity*/	0.03,
/*Angle*/		0];

_grad_linger setDropInterval grad_rotorwash_linger_interval;

/* _grad_linger setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];*/	
_grad_linger