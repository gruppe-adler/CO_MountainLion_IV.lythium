/*
	gets centerpoint below heli according to his yaw/pitch
*/

params ["_heli"];


private _startpoint = getPos _heli;
private _endpoint = (getPos _heli) vectorAdd ((vectorUp _heli) vectorMultiply -100);

"Sign_Sphere100cm_F" createVehicle _endpoint;


private _pointOnTerrain = terrainIntersectAtASL [_startpoint, _endpoint];
_pointOnTerrain params ["_x1", "_y1"];
_startpoint params ["_x2", "_y2"];

private _adjustmentPoint = [((_x1 + _x2)/2), ((_y1 + _y2)/2), 0];

// diag_log format ["terrain point is %1", _point];


// _point = [getPosATL _heli select 0, getPosATL _heli select 1, 0];

_adjustmentPoint