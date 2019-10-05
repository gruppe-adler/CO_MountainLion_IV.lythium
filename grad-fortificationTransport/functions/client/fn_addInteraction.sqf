params ["_vehicle", "_item"];

tky_fnc_getscreenname = {
    // with thanks to hoverguy and tryteyker
    private ["_suppliedtype","_type", "_cfg_type","_data", "_ret"];
    params ["_suppliedtype"];
    if ((typeName _suppliedtype) == "OBJECT") then
        {
        _type = (typeof _suppliedtype);
        }
        else
        {
        _type = _suppliedtype;
        };
    //assume classname is provided. if object is provided, get its classname
    switch (true) do
    {
        case(isClass(configFile >> "CfgMagazines" >> _type)): {_cfg_type = "CfgMagazines"};
        case(isClass(configFile >> "CfgWeapons" >> _type)): {_cfg_type = "CfgWeapons"};
        case(isClass(configFile >> "CfgVehicles" >> _type)): {_cfg_type = "CfgVehicles"};
        case(isClass(configFile >> "CfgGlasses" >> _type)): {_cfg_type = "CfgGlasses"};
    };
    _ret = getText (configFile >> _cfg_type >> _type >> "displayName");
    _ret
};

private _displayName = [typeOf _item] call tky_fnc_getscreenname;


private _action = ["grad_fortificationtransport_unload", "Unload " + _displayName, "\A3\ui_f\data\igui\cfg\actions\take_ca.paa", {
    params ["_target", "_player", "_params"];
    _params params ["_vehicle", "_item"];
    
    [_item] call grad_fortificationTransport_fnc_unloadItem;
}, {
	 params ["_target", "_player", "_params"];
    _params params ["_vehicle", "_item"];

	!isNull (_item getVariable ["GRAD_fortificationTransport_loadedOn", objNull])
}, nil, [_vehicle, _item]] call ace_interact_menu_fnc_createAction;
[_vehicle, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

/// private _name = typeOf _item;
private _action = ["grad_fortificationtransport_load", "Load " + _displayName, "\A3\ui_f\data\igui\cfg\actions\take_ca.paa", {
	 params ["_target", "_player", "_params"];
    _params params ["_vehicle", "_item"];   

    // systemChat format ["_vehicle %1 - _item %2", _vehicle, _item];
    [_vehicle, _item] call grad_fortificationTransport_fnc_loadItem;
}, {
	 params ["_target", "_player", "_params"];
    _params params ["_vehicle", "_item"];

	isNull (_item getVariable ["GRAD_fortificationTransport_loadedOn", objNull]) && 
    { _vehicle animationSourcePhase "container_hide" == 1  &&
	 _vehicle distance _item < ((sizeOf typeof _item) * 3) }
}, nil, [_vehicle, _item]] call ace_interact_menu_fnc_createAction;

[_item, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;