GRAD_ENHANCEDDUST_ACTIVE = true;
GRAD_ENHANCEDDUST_VEHICLES = [];

if (isServer) then {
	{
		if (_x isKindOf 'LandVehicle') then {
			GRAD_ENHANCEDDUST_VEHICLES = GRAD_ENHANCEDDUST_VEHICLES + [_x];
		};
	} forEach vehicles;
};

[GRAD_ENHANCEDDUST_VEHICLES] remoteExecCall ["GRAD_enhancedDust_fnc_initEmitters"];