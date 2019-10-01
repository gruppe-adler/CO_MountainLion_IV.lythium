params ["_vehicle", "_item"];



private _name = typeOf _item;
private _action = ["grad_fortificationtransport_unload", "Unload " + typeOf _item, "\A3\ui_f\data\igui\cfg\actions\take_ca.paa", {
    params ["_target", "_player", "_params"];
    _params params ["_vehicle", "_item"];
    
    [_item] call grad_fortificationTransport_fnc_unloadItem;
}, {
	 params ["_target", "_player", "_params"];
    _params params ["_vehicle", "_item"];
	!isNull (_item getVariable ["GRAD_fortificationTransport_loadedOn", objNull])
}, nil, [_vehicle, _item]] call ace_interact_menu_fnc_createAction;
[_vehicle, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;



private _name = typeOf _item;
private _action = ["grad_fortificationtransport_load", "Load " + typeOf _item, "\A3\ui_f\data\igui\cfg\actions\take_ca.paa", {
	 params ["_target", "_player", "_params"];
    _params params ["_vehicle", "_item"];    
    [_vehicle, _item] call grad_fortificationTransport_fnc_loadItem;
}, {
	 params ["_target", "_player", "_params"];
    _params params ["_vehicle", "_item"];
	isNull (_item getVariable ["GRAD_fortificationTransport_loadedOn", objNull]) && 
	_vehicle distance _item < 5
}, nil, [_vehicle, _item]] call ace_interact_menu_fnc_createAction;
[_item, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

