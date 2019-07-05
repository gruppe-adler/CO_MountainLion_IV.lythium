params ["_heli"];

private _color = _heli getVariable ["grad_rotorwash_colors", [0,0,0]];
_color params ["_grad_colorR", "_grad_colorG", "_grad_ColorB"];

_grad_linger = "#particlesource" createVehicleLocal (getpos player); 

_grad_linger setParticleCircle [10, [0, 0, 0]];
_grad_linger setParticleParams [
		["\A3\data_f\cl_basic", 1, 0, 1],
		 "", "Billboard", 1, grad_rotorwash_linger_lifetime, 
		 [0, 0, 0], 
		 [0, 0, 0], 0.3, 
		 1,
		 1,
		 50, // 100
		 [11, 12, 13, 13, 13, 13, 13, 13, 14, 14, 14, 14, 15, 16], 
		 [
		 	
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.7],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.6],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.5],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.4],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.35],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.3],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.25],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.2],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.1],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.1],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.05],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0.05],
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