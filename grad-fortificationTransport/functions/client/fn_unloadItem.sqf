params ["_item"];

private _unloadTime = 2;

private _onComplete = {
	params ["_item"];

	private _pos = (position player) findEmptyPosition [1,7,typeOf _item];

	if (count _pos < 1) exitWith { hint "no empty place for item"; };

	detach _item;
	_item setPos _pos;


	[_item,true,[0,2,0]] call ace_dragging_fnc_setDraggable;
    [_item,true,[0,1.5,0.8]] call ace_dragging_fnc_setCarryable;

    _item setVariable ["GRAD_fortificationTransport_loadedOn", objNull, true];
};

private _onCancel = {
	hint "aborted unloading";
};


[_unloadTime, _item, _onComplete, _onCancel, "Unloading..."] call ace_common_fnc_progressBar;