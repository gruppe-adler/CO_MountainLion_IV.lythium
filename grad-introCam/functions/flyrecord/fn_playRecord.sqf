/*

*/
params ["_vehicles", "_waypoints"];

private _spawnedVehicles = [];
private _group = createGroup civilian;
diag_log format ["vehicles. %1 %2", _vehicles, _waypoints];

{
	private _vehicleArray = _x;
	_vehicleArray params ["_classname", "_marker"];

	private _spawnPosition = getMarkerPos _marker;
	private _spawnDir = markerDir _marker;
	_spawnPosition set [2,40];

	private _vehicle = createVehicle [_classname, _spawnPosition, [], 0, "FLY"];
	_vehicle setDir _spawnDir;
	_vehicle setVelocityModelSpace [0, 150, 0];
	_vehicle flyInHeight 40;
	
	createVehicleCrew _vehicle;
	(group _vehicle) setBehaviour "CARELESS";
	_vehicle engineOn true;
	_vehicle setPilotLight true;
	_vehicle setCaptive true;
	(driver _vehicle) action ["CollisionLightOn", _vehicle];

	_spawnedVehicles pushBack _vehicle;

	diag_log format ["spawning.."];
} forEach _vehicles;

_spawnedVehicles joinSilent _group;
_group setFormation "WEDGE";
_group setSpeedMode "NORMAL";

{
	private _pos = getMarkerPos _x;
	_pos set [2,40];
  	private _waypoint = _group addWaypoint [_pos, 0];
} forEach _waypoints;

_spawnedVehicles