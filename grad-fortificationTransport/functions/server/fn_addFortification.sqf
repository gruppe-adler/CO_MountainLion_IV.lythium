/*

	[this, "sandbag_classname", [[0,0,0],[0,0,0],[0,0,0]] call GRAD_fortificationTransport_fnc_addFortification;

*/


params ["_vehicle", "_item", "_positions", ["_vector",[0,0,0]]];

{
	// private _fortificationDummy = _item createVehicle [0,0,0];
    _item disableCollisionWith _vehicle;
	_item attachTo [_vehicle, _x];
	_item setVectorDirAndUp _vector;

    _item setVariable ["GRAD_fortificationTransport_loadedOn", _vehicle, true];
	_item setVariable ["GRAD_fortificationTransport_Vehicle", _vehicle, true];
	_item setVariable ["GRAD_fortificationTransport_cargoPos", _x, true];

} forEach _positions;

[_vehicle, _item] call GRAD_fortificationTransport_fnc_addInteraction;