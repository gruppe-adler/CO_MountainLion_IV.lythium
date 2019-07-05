params ["_heli"];

private _color = _heli getVariable ["grad_rotorwash_colors", [0,0,0]];
_color params ["_grad_colorR", "_grad_colorG", "_grad_ColorB"];


_grad_dust = "#particlesource" createVehicleLocal (getpos player); 

/* _grad_dust setParticleCircle [10, [0, 0, 0]]; */

_grad_dust setParticleParams [
		["\A3\data_f\cl_basic", 1, 0, 1],
		 "", "Billboard", 1, grad_lifetime, 
		 [0, 0, 0], 
		 [grad_intensity, grad_intensity, grad_uplift], 0.3, 
		 grad_weight,
		 grad_volume,
		 grad_rubbing,
		 [7, 7, 8, 9, 11], 
		 [
		 	[0, 0, 0, 1],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, grad_transparency],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, grad_transparency],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, grad_transparency],
		 	[_grad_colorR, _grad_colorG, _grad_colorB, 0]
		 ], 
		 [0.08], 0, 0, "", "", _grad_dust, 0, true, grad_bounce];


_grad_dust setDropInterval grad_interval;

/* _grad_dust setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];*/	
_grad_dust