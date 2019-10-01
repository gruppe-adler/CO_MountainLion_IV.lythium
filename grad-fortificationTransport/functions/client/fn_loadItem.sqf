params ["_vehicle", "_item"];

private _loadTime = 2;

private _onComplete = {
	params ["_vehicle", "_item"];

	private _pos = _item getVariable ["GRAD_fortificationTransport_cargoPos", [0,0,0]];

	_item attachTo [_vehicle, _pos];

	[_item,false] call ace_dragging_fnc_setDraggable;
    [_item,false] call ace_dragging_fnc_setCarryable;

    _item setVariable ["GRAD_fortificationTransport_loadedOn", _vehicle, true];
};

private _onCancel = {
	hint "aborted loading";
};


[_loadTime, [_vehicle, _item], _onComplete, _onCancel, "Loading..."] call ace_common_fnc_progressBar;