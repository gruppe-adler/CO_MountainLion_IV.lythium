/*
[vehicle player, 120, 30, false, 2] spawn BIS_fnc_UnitCapture;

grad_introCam_fnc_playRecord;
*/
private _introPlaneC = createVehicle ["bwi_a3_at6b", [1789,10729.9,1033.49], [], 0, "FLY"];
createVehicleCrew _introPlaneC;
(group _introPlaneC) setBehaviour "CARELESS";
_introPlaneC engineOn true;
_introPlaneC setPilotLight true;
_introPlaneC setCaptive true;
(driver _introPlaneC) action ["CollisionLightOn", _introPlaneC];


private _introPlaneR = createVehicle ["bwi_a3_at6b", [1776.12,10696.5,1032.18], [], 0, "FLY"];
createVehicleCrew _introPlaneR;
(group _introPlaneR) setBehaviour "CARELESS";
_introPlaneR engineOn true;
_introPlaneR setPilotLight true;
_introPlaneR setCaptive true;
(driver _introPlaneR) action ["CollisionLightOn", _introPlaneR];


private _introPlaneL = createVehicle ["bwi_a3_at6b", [1755,10735.5,1028.8], [], 0, "FLY"];
createVehicleCrew _introPlaneL;
(group _introPlaneL) setBehaviour "CARELESS";
_introPlaneL engineOn true;
_introPlaneL setPilotLight true;
_introPlaneL setCaptive true;
(driver _introPlaneL) action ["CollisionLightOn", _introPlaneL];



[_introPlaneC, _introPlaneR, _introPlaneL] spawn {
	params ["_introPlaneC", "_introPlaneR", "_introPlaneL"];	

	[ _introPlaneC, [] call GRAD_introCam_fnc_planeC, [], false, nil, nil, 0 ] spawn BIS_fnc_UnitPlay;
	[ _introPlaneR, [] call GRAD_introCam_fnc_planeR, [], false, nil, nil, 0 ] spawn BIS_fnc_UnitPlay;
	[ _introPlaneL, [] call GRAD_introCam_fnc_planeL, [], false, nil, nil, 0 ] spawn BIS_fnc_UnitPlay;

	sleep 110;

	_introPlaneC setvariable ["BIS_fnc_unitPlay_terminate",true];
	_introPlaneR setvariable ["BIS_fnc_unitPlay_terminate",true];
	_introPlaneL setvariable ["BIS_fnc_unitPlay_terminate",true];

	(group _introPlaneC) addWaypoint [[worldSize,0,100], 0];
	(group _introPlaneR) addWaypoint [[worldSize,100,100], 0];
	(group _introPlaneL) addWaypoint [[worldSize,200,100], 0];

	sleep 120;

	{_introPlaneC deleteVehicleCrew _x} forEach crew _introPlaneC;
	{_introPlaneR deleteVehicleCrew _x} forEach crew _introPlaneR;
	{_introPlaneL deleteVehicleCrew _x} forEach crew _introPlaneL;
	

	deleteVehicle _introPlaneC;
	deleteVehicle _introPlaneR;
	deleteVehicle _introPlaneL;

};

[_introPlaneC, _introPlaneR, _introPlaneL]