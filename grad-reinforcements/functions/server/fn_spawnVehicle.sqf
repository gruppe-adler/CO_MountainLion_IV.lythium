params ["_type", "_position", "_dir", "_initSkin", "_initExtras", "_cargo"];

private _veh = createVehicle [_type, _position, [], 0, "NONE"];
[
	_veh,
	_initSkin, 
	_initExtras
] call BIS_fnc_initVehicle;

_veh setDir _dir;
createVehicleCrew _veh;
(group _veh) addVehicle _veh;

_veh