params ["_position"];

private _alertUnits = [];
{
	if (side _x == east) then {
		_alertUnits pushBack _x;
	};
} forEach (nearestObjects [_position ,["Man"], 250]);


{

	_x call BIS_fnc_ambientAnim__terminate;
	_x setBehaviour "ALERT";
  	_x setCombatMode "YELLOW";
  	_x setUnitPos "MIDDLE";
  	_x setUnitPosWeak "MIDDLE";
  	_x setSpeedMode "FULL";

  	sleep 0.1;

} forEach _alertUnits;

"Group" setDynamicSimulationDistance 1000;
"Vehicle" setDynamicSimulationDistance 1000;