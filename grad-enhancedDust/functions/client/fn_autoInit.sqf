GRAD_ENHANCEDDUST_VEHICLES = [];
GRAD_ENHANCEDDUST_ACTIVE = true;

{
	if (_x isKindOf 'LandVehicle') then {
		GRAD_ENHANCEDDUST_VEHICLES = GRAD_ENHANCEDDUST_VEHICLES + [_x];
	};
} forEach vehicles;

[GRAD_ENHANCEDDUST_VEHICLES] remoteExecCall ["GRAD_enhancedDust_fnc_initEmitters", [0,-2] select isDedicated];



{

    _x addEventHandler ["CuratorGroupPlaced", {
        params ["", "_group"];

        { 
            if (_x isKindOf "LandVehicle") then {
            	[[_x]] call GRAD_enhancedDust_fnc_initEmitters;
            };
        } forEach units _group;
    }];

    _x addEventHandler ["CuratorObjectPlaced", {
        params ["", "_object"];
        
        if (_object isKindOf "LandVehicle") then {
            	[[_object]] call GRAD_enhancedDust_fnc_initEmitters;
        };
    }];

} forEach allCurators;