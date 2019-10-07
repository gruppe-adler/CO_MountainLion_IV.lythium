params ["_vehicle", "_item"];

private _loadTime = 1;
// _item enableSimulationGlobal false;

private _onComplete = {
	params ["_params"];
    _params params ["_vehicle", "_item"];

    // systemChat format ["_vehicle %1 - _item %2", _vehicle, _item];

    if (
        _item isKindOf "Air" && 
        (count (getVehicleCargo _vehicle))>0
       ) exitWith {
        hint "make room for Helicopter first";
    };

    private _blockCargo = "C_Offroad_01_F" createVehicle [0,0,0];
    _blockCargo hideObjectGlobal true;
    _vehicle setVehicleCargo _blockCargo;
    _vehicle enableVehicleCargo false;
    _vehicle setVariable ["GRAD_fortificationTransport_blockCargo", _blockCargo, true];

    [_item,false] call ace_dragging_fnc_setDraggable;
    [_item,false] call ace_dragging_fnc_setCarryable;

	private _pos = _item getVariable ["GRAD_fortificationTransport_cargoPos", [0,0,0]];
    private _vector = _item getVariable ["GRAD_fortificationTransport_cargoVector", [[0,1,0],[0,0,1]]];
    // _pos params ["_posX", "_posY", "_posZ"];

    diag_log format ["logging cargopos load  %1", _pos];

    _item attachTo [_vehicle, _pos];
    _item setVectorDirAndUp _vector;

    _item setVariable ["GRAD_fortificationTransport_loadedOn", _vehicle, true];

    private _count = _vehicle getVariable ["GRAD_fortificationTransport_count", 0];
    _vehicle setVariable ["GRAD_fortificationTransport_count", (_count + 1), true];
};

private _onCancel = {
    params ["_params"];
    _params params ["_vehicle", "_item"];

	hint "aborted loading";
    // _item enableSimulationGlobal true;
};


[_loadTime, [_vehicle, _item], _onComplete, _onCancel, "Loading..."] call ace_common_fnc_progressBar;