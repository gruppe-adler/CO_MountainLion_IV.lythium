params ["_modulePosition"];

#include "zeusModulesParameters.hpp"

private _acceptablePositionFound = false;
private _numberOfIterations = 1;

private _allCuratorsVariable = [];
{
	_allCuratorsVariable pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;	

if ((_UNITS_TO_SPAWN isEqualTo []) || (_CARS_TO_SPAWN isEqualTo [])) exitWith {["_UNITS_TO_SPAWN and _CARS_TO_SPAWN need to be defined, before using this module! You can define them in the zeusModulesParameters.hpp"] remoteExec ["systemChat", _allCuratorsVariable];};
if (_SIDE_OF_UNITS isEqualTo "") exitWith {["_SIDE_OF_UNITS needs to be defined, before using this module! You can define the variable in the zeusModulesParameters.hpp"] remoteExec ["systemChat", _allCuratorsVariable];};
if (surfaceIsWater _modulePosition) exitWith {["The module must be placed on land!"] remoteExec ["systemChat", _allCuratorsVariable];};

["Gathering buildings in the area..."] remoteExec ["systemChat", _allCuratorsVariable];

private _includeArea = [crashSite, 3000, 3000, 0, false];
private _excludeArea = [crashSite, 700, 700, 0, false];
private _allNearBuildings = nearestObjects [crashSite, ["House_F"], 3000];
private _buildingsInArea = [];
{ 
if ((_x inArea _includeArea) && !(_x inArea _excludeArea) && !(([_x] call CBA_fnc_buildingPositions) isEqualTo []) && !(isNull ([getPos _x, 150] call BIS_fnc_nearestRoad))) then {
	_buildingsInArea pushBackUnique _x; 
}; 
	
} forEach _allNearBuildings;

if (_buildingsInArea isEqualTo []) exitWith {["No suitable spawn position could be found. Please check the module's position and try again."] remoteExec ["systemChat", _allCuratorsVariable];};

scopeName "Main";
while {!(_acceptablePositionFound)} do {
	scopeName "loop1";
	if (_numberOfIterations > 100) exitWith {["No suitable spawn position could be found. Please check the module's position and try again."] remoteExec ["systemChat", _allCuratorsVariable];};
	if !(_acceptablePositionFound) then {
		scopeName "Reset";		

		private _carClass = selectRandom _CARS_TO_SPAWN;
		private _carSeatsAmount = [_carClass, true] call BIS_fnc_crewCount;

		private _spawnBuilding = selectRandom _buildingsInArea;
		private _buildingsSpawnPositions = [_spawnBuilding] call CBA_fnc_buildingPositions;
		if ((count _buildingsSpawnPositions) < _carSeatsAmount) then {
			_buildingsCloseBy = (nearestObjects [_spawnBuilding, ["House"], 100]) select {_x in _buildingsInArea};
			while {!(_buildingsCloseBy isEqualTo []) && (count _buildingsSpawnPositions) < _carSeatsAmount} do {
				private _building = selectRandom _buildingsCloseBy;
				_buildingsSpawnPositions append ([_building] call CBA_fnc_buildingPositions);
				_buildingsCloseBy deleteAt (_buildingsCloseBy find _building);
			};
		};

		private _nearestRoad = [getPos _spawnBuilding, 100] call BIS_fnc_nearestRoad;
		private _carSpawnPosition = [_nearestRoad, 2, 10, 3, 0, 0.3, 0, [], [[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
		_carSpawnPosition set [2,0];

		if (_carSpawnPosition isEqualTo [0,0,0]) then {
			[format["Iteration %1 failed to find a suitable spawn position. Searching new position...", _numberOfIterations]] remoteExec ["systemChat", _allCuratorsVariable];
			_numberOfIterations = _numberOfIterations + 1;
			breakOut "Reset";
		};


		{
			if (side _x != sideLogic) then {
				private _eyePos = eyePos _x;
				private _carSpawnPositionHigh = _carSpawnPosition;
				_carSpawnPositionHigh set [2, (_carSpawnPositionHigh#2) + 2];
				if ((([objNull, "VIEW"] checkVisibility [_eyePos, _carSpawnPositionHigh]) > 0.1) || (([objNull, "VIEW"] checkVisibility [_eyePos, _carSpawnPosition]) > 0.1)) then {		
					[format["Iteration %1 failed to find a suitable spawn position. Searching new position...", _numberOfIterations]] remoteExec ["systemChat", _allCuratorsVariable];
					_numberOfIterations = _numberOfIterations + 1;
					breakOut "Reset";
				};
			};
		} foreach allplayers;


		private _carPosition = _carSpawnPosition findEmptyPosition [0,0,_carClass];
		if ((_carPosition isEqualTo []) || !(isOnRoad _nearestRoad)) then {
			[format["Iteration %1 failed to find a suitable spawn position. Searching new Road...", _numberOfIterations]] remoteExec ["systemChat", _allCuratorsVariable];
			_numberOfIterations = _numberOfIterations + 1;
			breakOut "Reset";		
		};

		["spawning units..."] remoteExec ["systemChat", _allCuratorsVariable];
		private _car = _carClass createVehicle _carPosition;
		_car setDir ((getPos _car) getDir (getPos _nearestRoad));
		private _attackGroup = createGroup [_SIDE_OF_UNITS, true];
		
		while {((count (units _attackGroup)) < _carSeatsAmount) && !(_buildingsSpawnPositions isEqualTo [])} do {
			private _type = selectRandom _UNITS_TO_SPAWN;
			private _position = selectRandom _buildingsSpawnPositions;
			(_type createUnit [_position, _attackGroup]) setPosATL _position;
			_buildingsSpawnPositions deleteAt (_buildingsSpawnPositions find _position);
		};

		private _getInWaypoint = _attackGroup addWayPoint [_car, -1, 1];
		_getInWaypoint setWaypointType "GETIN";
		_getInWaypoint waypointAttachVehicle _car;
		_getInWaypoint setWaypointBehaviour "AWARE";
		_getInWaypoint setWaypointSpeed "FULL";

		private _potTargetRoads = [];
		private _searchRadius = 300;
		["searching position to disembark..."] remoteExec ["systemChat", _allCuratorsVariable];
		while {(_searchRadius < 1005) && (_potTargetRoads isEqualTo [])} do {
			{
				if ((isOnRoad _x) && ((_x distance _modulePosition) > 250)) then {
					_potTargetRoads pushBackUnique _x;
				};
				
			} foreach (_modulePosition nearRoads _searchRadius);
			_searchRadius = _searchRadius + 5;
		};		

		if !(_potTargetRoads isEqualTo []) then {

			_roadDistance = 10000;
			_bestRoad = selectRandom _potTargetRoads;
			{
				if (((_x distance _carPosition) < _roadDistance) && isOnRoad _x) then {
					_roadDistance = _x distance _carPosition;
					_bestRoad = _x;
				};

			} foreach _potTargetRoads;
			
			[format["Found a suitable position (%1 meters from attack-point)", round (_bestRoad distance _modulePosition)]] remoteExec ["systemChat", _allCuratorsVariable];
			
			private _getOutWaypoint = _attackGroup addWayPoint [getPosASL _bestRoad, -1, 2];
			_getOutWaypoint setWaypointType "GETOUT";
			_getOutWaypoint setWaypointBehaviour "AWARE";
			_getOutWaypoint setWaypointSpeed "FULL";
		}
		else 
		{
			["Couldn't find a suitable position to disembark, using random position"] remoteExec ["systemChat", _allCuratorsVariable];
			private _getOutWaypoint = _attackGroup addWayPoint [[_modulePosition, 600, 1000, 10] call BIS_fnc_findSafePos, -1, 2];
			_getOutWaypoint setWaypointType "GETOUT";
			_getOutWaypoint setWaypointBehaviour "AWARE";
			_getOutWaypoint setWaypointSpeed "FULL";
		};

		private _attackWaypoint = _attackGroup addWayPoint [_modulePosition, -1, 3];
		_attackWaypoint setWaypointType "SAD";
		_attackWaypoint setWaypointBehaviour "AWARE";
		_attackWaypoint setWaypointSpeed "FULL";
		
		_acceptablePositionFound = true;
	};
};