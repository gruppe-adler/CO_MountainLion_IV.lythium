params ["_item"];

private _unloadTime = 1;

private _onComplete = {
	params ["_item"];

    private _type = typeOf _item;
    private _vehicle = _item getVariable ["GRAD_fortificationTransport_loadedOn", objNull];
    private _vector =  _item getVariable ["GRAD_fortificationTransport_cargoVector", [[0,1,0],[0,0,1]]];
    private _position = _item getVariable ["GRAD_fortificationTransport_cargoPos", [0,0,0]];
	
    detach _item;
	deleteVehicle _item;

    private _item = createVehicle [_type, player, [], (sizeOf _type * 1.2), "NONE"];// _type createVehicle (position player);

    [_item, -1] call ace_cargo_fnc_setSize;

    if (!(_item isKindOf "Air")) then {
	    [_item,true,[0,2,0]] call ace_dragging_fnc_setDraggable;
        [_item,true,[0,1.5,0.8]] call ace_dragging_fnc_setCarryable;
    };
    private _blockCargo = _vehicle getVariable ["GRAD_fortificationTransport_blockCargo", objNull];
    if (!(isNull _blockCargo)) then {
        _vehicle setVehicleCargo objNull;
        deleteVehicle _blockCargo;
    };

    _vehicle enableVehicleCargo true;

    _item setVariable ["GRAD_fortificationTransport_loadedOn", objNull, true];
    _item setVariable ["GRAD_fortificationTransport_cargoVector", _vector, true];
    _item setVariable ["GRAD_fortificationTransport_cargoPos", _position, true];

    [_vehicle, _item] remoteExec ["GRAD_fortificationTransport_fnc_addInteraction", [0,-2] select isDedicated, true];

    private _count = _vehicle getVariable ["GRAD_fortificationTransport_count", 1];
    _vehicle setVariable ["GRAD_fortificationTransport_count", (_count -1), true];
};

private _onCancel = {
	hint "aborted unloading";
};


[_unloadTime, _item, _onComplete, _onCancel, "Unloading..."] call ace_common_fnc_progressBar;