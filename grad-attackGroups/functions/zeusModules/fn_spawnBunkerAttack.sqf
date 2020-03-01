params ["_bunker", "_radius", "_groupSize", "_formation", "_attackPosition"];

#include "zeusModulesParameters.hpp"

private _allCuratorsVariable = [];
{
	_allCuratorsVariable pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;

if ((_UNITS_TO_SPAWN isEqualTo []) || (_SIDE_OF_UNITS isEqualTo [])) exitWith {["_UNITS_TO_SPAWN and _SIDE_OF_UNITS need to be defined, before using this module! You can define them in the zeusModulesParameters.hpp"] remoteExec ["systemChat", _allCuratorsVariable];};

private _safeToSpawn = false;
private _iterations = 0;

while {!(_safeToSpawn) && _iterations < 100} do {
	scopeName "loop1";
	if (true) then {
		scopeName "loop2";
		{
			if (side _x != sideLogic) then {
				private _eyePos = eyePos _x;
				private _SpawnPositionHigh = getPosASL _bunker;
				_spawnPositionHigh set [2, (_spawnPositionHigh#2) + 2];
				if ((([objNull, "VIEW"] checkVisibility [_eyePos, _spawnPositionHigh]) > 0.1) || (([objNull, "VIEW"] checkVisibility [_eyePos, getPosASL _bunker]) > 0.1) || ((_x distance _bunker) < 80)) then {		
					_iterations = _iterations + 1;
					sleep 0.1;
					breakOut "loop2";
				};
			};
		} foreach allplayers;
		_safeToSpawn = true;
	};
};

if (_iterations >= 100) exitWith {[format["Units can't spawn at position %1. Either the spawn position is visible, or the players are too close. Try a different bunker", _bunker]] remoteExec ["systemChat", _allCuratorsVariable];};

private _attackGroup = createGroup [_SIDE_OF_UNITS, true];

while {(count (units _attackGroup)) < _groupSize} do {
	private _type = selectRandom _UNITS_TO_SPAWN;
	_type createUnit [(getPos _bunker) findEmptyPosition [0, 10, _type], _attackGroup];
};

switch (_attackPosition) do {
	case "CRASHSITE": {
		private _attackWaypoint = _attackGroup addWaypoint [crashSite, _radius];
		_attackWaypoint setWaypointType "SAD";
		_attackWaypoint setWaypointBehaviour "AWARE";
		_attackWaypoint setWaypointSpeed "FULL";
		_attackWaypoint setWaypointFormation _formation;
	};

	case "NEARESTPLAYER": {
		private _nearestPlayer = null;
		{
			if (side _x != sideLogic) then {
				private _distance = 100000;
				if ((_bunker distance _x) < _distance) then {		
					_nearestPlayer = _x;
					_distance = _bunker distance _x;
				};
			};
		} foreach allplayers;

		private _attackWaypoint = _attackGroup addWaypoint [_nearestPlayer, _radius];
		_attackWaypoint setWaypointType "SAD";
		_attackWaypoint setWaypointBehaviour "AWARE";
		_attackWaypoint setWaypointSpeed "FULL";
		_attackWaypoint setWaypointFormation _formation;
	};

	case "NEARESTPLAYERCRASHSITE": {
		private _nearestPlayer = null;
		{
			if (side _x != sideLogic) then {
				private _distance = 100000;
				if ((crashsite distance _x) < _distance) then {		
					_nearestPlayer = _x;
					_distance = crashsite distance _x;
				};
			};
		} foreach allplayers;

		private _attackWaypoint = _attackGroup addWaypoint [_nearestPlayer, _radius];
		_attackWaypoint setWaypointType "SAD";
		_attackWaypoint setWaypointBehaviour "AWARE";
		_attackWaypoint setWaypointSpeed "FULL";
		_attackWaypoint setWaypointFormation _formation;		
	};

	default {
		private _attackWaypoint = _attackGroup addWaypoint [crashSite, _radius];
		_attackWaypoint setWaypointType "SAD";
		_attackWaypoint setWaypointBehaviour "AWARE";
		_attackWaypoint setWaypointSpeed "FULL";
		_attackWaypoint setWaypointFormation _formation;
	};
};