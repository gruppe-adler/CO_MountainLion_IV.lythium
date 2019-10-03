/*

	[logistikTruck, this] call GRAD_fortificationTransport_fnc_configureForVehicle;

*/

params ["_vehicle", "_item"];

_item enableSimulationGlobal false;
[_item, -1] call ace_cargo_fnc_setSize;

private _position = _vehicle worldToModelVisual position _item;
[_item, _vehicle] call BIS_fnc_attachToRelative;
[_vehicle, _item, _position] call GRAD_fortificationTransport_fnc_addFortification;