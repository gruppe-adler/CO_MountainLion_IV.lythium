// "_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_isAttached", ["_offset",[0,0,0]],  "_radius"


/*
	
	CAM TYPES:

	["FREE", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ATTACHED", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ROTATE", angleStart, angleEnd, target, duration, fov1, fov2, radius (int), cclockwise (bool)]

*/

if (!isServer) exitWith {};

private _vehicleDefinitions = [
    [
        ["bwi_a3_at6b", getMarkerPos "introPlane1"],
        ["bwi_a3_at6b", getMarkerPos "introPlane2"]
    ],
    getMarkerPos "introPlaneWaypoint"
];

private _introVehicles = _vehicleDefinitions call GRAD_introCam_fnc_playRecord;


private _camDefinitions = [
    ["FREE", getPos intro_camPos1, getPos intro_camPos2, intro_camTarget1, intro_camTarget2, 35.4, 0, 0.4, 0.2, [0,0,0], [0,0,0]],
	["FREE", getPos intro_camPos2, getPos intro_camPos3, intro_camTarget2, _introVehicles select 0, 28, 0, 0.2, 0.02, [0,0,0], [0,0,5]],
	["FREE", getPos intro_camPos3, getPos intro_end, _introVehicles select 0, intro_end2, 63.4, 0, 0.02, 0.2, [0,0,5], [0,0,2]]
];

/////// dont edit below

{
  	[_x] call GRAD_introCam_fnc_addShot;
} forEach _camDefinitions;