/*

	[logistikTruck, this] call GRAD_fortificationTransport_fnc_configureForVehicle;

*/

params ["_vehicle", "_item"];

// _item enableSimulationGlobal false;
[_item, -1] call ace_cargo_fnc_setSize;


[_item, _vehicle] call BIS_fnc_attachToRelative;
[_vehicle, _item] call GRAD_fortificationTransport_fnc_addFortification;