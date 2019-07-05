/*
	gets centerpoint below heli according to his yaw/pitch
*/

params ["_heli"];

/*
_startpoint = getPos _heli;
_endpoint = (getPos _heli) vectorAdd ((vectorUp _heli) vectorMultiply -100);

"Sign_Sphere100cm_F" createVehicle _endpoint;


_point = terrainIntersectAtASL [_startpoint, _endpoint];

diag_log format ["terrain point is %1", _point];
*/

_point = [getPosATL _heli select 0, getPosATL _heli select 1, 0];

_point