params ["_veh"];

_veh setHitPointDamage ["HitHull",.88];
_veh setHitPointDamage ["HitFuel",.88];
_veh setHitPointDamage ["HitHRotor",.88];
// _veh setHitPointDamage ["HitVRotor",.88];
_veh setHitPointDamage ["HitEngine",1];
_veh setHitPointDamage ["hitavionics",1];

[[10, 2, 15]] remoteExecCall ["addCamShake", [0,-2] select isDedicated];

private _smoke = createVehicle ["test_EmptyObjectForSmoke", position _veh, [], 0, "CAN_COLLIDE"];
_smoke attachTo [_veh,[0,0,0],"motor"];

_veh allowDamage false;


// waits till ground is hit, stores travel vector
[{
	params ["_veh"];
	if (!(isTouchingGround _veh)) then {
		_veh setVariable ["GRAD_survivableCrash_velocity", vectorMagnitude velocity _veh];
	};
	isTouchingGround _veh
},
{
	params ["_veh"];

	// trigger ejection and effects on crew
	{
		[_x, _veh] remoteExecCall ["GRAD_survivableCrash_fnc_onCrashLocal", _x];
	} forEach crew _veh;


	[{
		params ["_veh"];
		count (crew _veh) < 1
	},{
		params ["_veh"];
		_veh setVehicleLock "LOCKED";
		_veh allowDamage true;
		{ _veh setHitPointDamage [_x,.7]; } forEach [
			"hithydraulics",
			"hittransmission",
			"glass1",
			"glass2",
			"glass3",
			"glass4",
			"glass5",
			"glass6"
		];
		_veh allowDamage false;

	}, [_veh]] call CBA_fnc_waitUntilAndExecute;

	// lets vehicle slide a bit
	/*
	private _velocityVeh = velocity _veh;
	private _dir = (_velocityVeh select 0) atan2 (_velocityVeh select 1);
	private _speed = 4 + random 2;

	_velocityVeh = [(sin _dir) * _speed * sqrt abs(_velocityVeh select 0),
		(cos _dir) * _speed * sqrt abs(_velocityVeh select 1),
		(1 + random 4) * sqrt(abs(_velocityVehPrev)) + .4 ];
	_veh setVelocity _velocityVeh;
	*/

}, [_veh]] call CBA_fnc_waitUntilAndExecute;