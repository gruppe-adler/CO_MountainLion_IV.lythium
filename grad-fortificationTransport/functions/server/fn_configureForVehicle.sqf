/*

	[logistikTruck, this] call GRAD_fortificationTransport_fnc_configureForVehicle;

*/

params ["_vehicle", "_item"];

private _offset = _vehicle worldToModel getPosVisual _item;
private _vector = [_vehicle, _item] call GRAD_fortificationTransport_fnc_getAttachVector;

[_vehicle, _item, [_offset], _vector] call GRAD_fortificationTransport_fnc_addFortification;