_serverLoop = [{
    params ["_args", "_handle"];
    _args params [];

    {
        // check if veh should be active
        if ([_x] call grad_rotorwash_fnc_isActive) then {
                
            if (!(_x in GRAD_ROTORWASH_VEHICLES_ACTIVE)) then {

                // add vehicle to active list and activate emitters on clients
                GRAD_ROTORWASH_VEHICLES_ACTIVE = GRAD_ROTORWASH_VEHICLES_ACTIVE + [_x];

                _point = [_x] call grad_rotorwash_fnc_getWashOrigin;
                _color = [_point] call grad_rotorwash_fnc_getSurfaceColor;
                [_x, _point, _color, true] remoteExec ["grad_rotorwash_fnc_adjustParams", 0, false];

            } else {
            
                // adjust emitter color
                _point = [_x] call grad_rotorwash_fnc_getWashOrigin;
                _color = [_point] call grad_rotorwash_fnc_getSurfaceColor;

                [_x, _point, _color] remoteExec ["grad_rotorwash_fnc_adjustParams", 0, false];
            };
        } else {
            // do nothing for helis without reason
            if (_x in GRAD_ROTORWASH_VEHICLES_ACTIVE) then {

                // remove vehicle from active list and deactivate emitters on clients
                GRAD_ROTORWASH_VEHICLES_ACTIVE = GRAD_ROTORWASH_VEHICLES_ACTIVE - [_x];
                [_x] remoteExec ["grad_rotorwash_fnc_emitterDeactivate", 0, false];  
            };
        };

    } forEach GRAD_ROTORWASH_VEHICLES_SUPPORTED;

    // placeholder
    if (false) exitWith {
    	[_handle] call CBA_fnc_removePerFrameHandler;
    };
   
},0.25,[]] call CBA_fnc_addPerFrameHandler;