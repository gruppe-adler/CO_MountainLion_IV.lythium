// "_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_isAttached", ["_offset",[0,0,0]],  "_radius"


/*
	
	CAM TYPES:

	["FREE", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ATTACHED", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ROTATE", angleStart, angleEnd, target, duration, fov1, fov2, radius (int), cclockwise (bool)]

*/

if (!isServer) exitWith {};

private _planes = [] call GRAD_introCam_fnc_playRecord;
private _targetPlane = _planes select 0;

private _definitions = [
	["FREE", getPos intro_camPos1, getPos intro_camPos2, intro_camTarget, _targetPlane, 63.4, 0, 0.4, 0.6, [0,0,20], [0,2,20]],
	["FREE", getPos intro_camPos2, getPos ml_mosque, _targetPlane, muezzin, 10, 2, 0.6, 0.4, [0,2,20], [0,-20,20]],
	["FREE", getPos ml_mosque, getPos intro_end, muezzin, intro_billboard, 13, 2, 0.4, 0.3, [0,-20,20], [0,1,3]],
	["FREE", getPos intro_end, getPos intro_end2, intro_billboard, intro_billboard, 10, 2, 0.3, 0.4, [0,1,3], [0,0,4]]
];

/////// dont edit below

{
  	[_x] call GRAD_introCam_fnc_addShot;
} forEach _definitions;