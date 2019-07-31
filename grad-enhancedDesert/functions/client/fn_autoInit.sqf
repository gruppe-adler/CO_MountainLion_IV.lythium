GRAD_enhancedDesert_VEHICLES = [];

// thus can be overwritten any time by server
GRAD_enhancedDesert_ACTIVE = missionNamespace getVariable ["GRAD_enhancedDesert_ACTIVE", true];

{
	if (_x isKindOf 'LandVehicle') then {
		GRAD_enhancedDesert_VEHICLES = GRAD_enhancedDesert_VEHICLES + [_x];
	};
} forEach vehicles;

[GRAD_enhancedDesert_VEHICLES] call GRAD_enhancedDesert_fnc_initEmitters;



{

    _x addEventHandler ["CuratorGroupPlaced", {
        params ["", "_group"];

        { 
            if (_x isKindOf "LandVehicle") then {
            	[[_x]] call GRAD_enhancedDesert_fnc_initEmitters;
            };
        } forEach units _group;
    }];

    _x addEventHandler ["CuratorObjectPlaced", {
        params ["", "_object"];
        
        if (_object isKindOf "LandVehicle") then {
            	[[_object]] call GRAD_enhancedDesert_fnc_initEmitters;
        };
    }];

} forEach allCurators;

[] call GRAD_enhancedDesert_fnc_roadReflection;