// "_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_isAttached", ["_offset",[0,0,0]],  "_radius"


/*
	
	CAM TYPES:

	["FREE", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ATTACHED", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ROTATE", angleStart, angleEnd, target, duration, fov1, fov2, radius (int), cclockwise (bool)]

*/

if (!isServer) exitWith {};

// private _planes = [] call GRAD_introCam_fnc_playRecord;
private _targetPlane = _planes select 0;

private _definitions = [
	["FREE", getPos intro_camPos1, getPos intro_camPos2, intro_camTarget, introPlane, 63.4, 0, 0.4, 0.6, [0,0,2], [0,0,20]],
	["FREE", getPos intro_camPos2, getPos intro_end, introPlane, intro_end2, 63.4, 0, 0.6, 0.4, [0,0,20], [0,0,2]]
];

/////// dont edit below

{
  	[_x] call GRAD_introCam_fnc_addShot;
} forEach _definitions;