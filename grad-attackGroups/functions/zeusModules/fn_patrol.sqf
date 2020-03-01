params ["_group", "_center", "_radius", "_waypointAmount"];

_center setDir (_center getDir (leader _group));

private _incrementLoop = 0;
private _incrementDirection = 0;
private _step = 360 / _waypointAmount;

while {_incrementLoop < _waypointAmount} do {
	private _waypointPos = _center getRelPos [_radius, _incrementDirection];
	private _waypoint = _group addWaypoint [_waypointPos, 0];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointSpeed "LIMITED";
	_waypoint setWaypointBehaviour "SAFE";
	_waypoint setWaypointCompletionRadius 5;
	_incrementDirection = _incrementDirection + _step;
	_incrementLoop = _incrementLoop + 1;
};

private _waypoint = _group addWaypoint [_center getRelPos [_radius, 0], 0];
_waypoint setWaypointType "CYCLE";