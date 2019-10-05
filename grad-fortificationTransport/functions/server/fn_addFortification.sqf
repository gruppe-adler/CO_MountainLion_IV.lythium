/*

	[this, "sandbag_classname", [[0,0,0],[0,0,0],[0,0,0]] call GRAD_fortificationTransport_fnc_addFortification;

*/


params ["_vehicle", "_item"];


// private _fortificationDummy = _item createVehicle [0,0,0];
_item disableCollisionWith _vehicle;
// _item setVectorDirAndUp _vector;
private _count = _vehicle getVariable ["GRAD_fortificationTransport_count", 0];
_vehicle setVariable ["GRAD_fortificationTransport_count", (_count + 1), true];

[{
    params ["_vehicle", "_item"];

    private _position = _vehicle worldToModelVisual (position _item); // (getPos _vehicle) vectorDiff (getPos _item); 
    private _vector = [_vehicle, _item] call BIS_fnc_vectorDirAndUpRelative;
    // private _vector = [vectorDir _item, vectorUp _item];
    // private _pos = _vehicle worldToModelVisual position _item;

    // _item enableSimulationGlobal false;
    _item setVariable ["GRAD_fortificationTransport_loadedOn", _vehicle, true];
    _item setVariable ["GRAD_fortificationTransport_cargoVector", _vector, true];

    /*
    private _position2 = [_position select 0, _position select 1, ((_position select 2) + 0.8)];
    systemChat format ["saving %1 as %2", _position, _position2];
    */
    _item setVariable ["GRAD_fortificationTransport_cargoPos", _position, true];
    diag_log format ["logging cargopos save  %1", _position];

}, [_vehicle, _item], 1] call CBA_fnc_waitAndExecute;



[_vehicle, _item] call GRAD_fortificationTransport_fnc_addInteraction;