/*

*/
params ["_vehicles", "_waypointPos"];

private _spawnedVehicles = [];
private _group = createGroup civilian;
diag_log format ["vehicles. %1 %2", _vehicles, _waypointPos];

{
	private _vehicleArray = _x;
	_vehicleArray params ["_classname", "_spawnPosition"];

	_spawnPosition set [2,40];

	private _vehicle = createVehicle [_classname, _spawnPosition, [], 0, "FLY"];
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

private _waypoint = _group addWaypoint [_waypointPos, 0];
_waypoint setWaypointStatements ["true","{{deleteVehicle _x} forEach crew _x; deleteVehicle _x; } forEach thisList;"];

_spawnedVehicles