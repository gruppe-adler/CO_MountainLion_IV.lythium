params ["_position", "_displayName"];

    [{
        params ["_position", "_displayName"];

        _position set [2,1.5];

        private _function = {
            params ["_args", "_handle"];
            _args params ["_position", "_displayName"];

            drawIcon3D [
                "a3\ui_f\data\gui\Rsc\RscDisplayIntel\azimuth_ca.paa", 
                [1,1,1,1], 
                (_position) vectorAdd [0,0,1], 1, 1, 45, 
                format ["%1 (%2m)", _displayName, round (player distance _position)], 
                1, 0.04, "PuristaMedium", "center", true
            ];
        };

        private _handle = [_function, 0, [_position, _displayName]] call CBA_fnc_addPerFrameHandler;

        [{
            params ["_handle"];
            [_handle] call CBA_fnc_removePerFrameHandler;
        }, _handle, 30] call CBA_fnc_waitAndExecute;


}, [_position, _displayName], 80] call CBA_fnc_waitAndExecute;