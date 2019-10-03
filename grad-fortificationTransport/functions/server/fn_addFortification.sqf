/*

	[this, "sandbag_classname", [[0,0,0],[0,0,0],[0,0,0]] call GRAD_fortificationTransport_fnc_addFortification;

*/


params ["_vehicle", "_item"];


// private _fortificationDummy = _item createVehicle [0,0,0];
// _item disableCollisionWith _vehicle;
// _item setVectorDirAndUp _vector;

_item setVariable ["GRAD_fortificationTransport_loadedOn", _vehicle, true];
_item setVariable ["GRAD_fortificationTransport_Vehicle", _vehicle, true];
_item setVariable ["GRAD_fortificationTransport_cargoVector", ([_item, _vehicle, true] call BIS_fnc_vectorDirAndUpRelative), true];
_item setVariable ["GRAD_fortificationTransport_cargoPos", _item worldToModel position _vehicle, true];

private _count = _vehicle getVariable ["GRAD_fortificationTransport_count", 0];
_vehicle setVariable ["GRAD_fortificationTransport_count", (_count + 1), true];


[_vehicle, _item] call GRAD_fortificationTransport_fnc_addInteraction;