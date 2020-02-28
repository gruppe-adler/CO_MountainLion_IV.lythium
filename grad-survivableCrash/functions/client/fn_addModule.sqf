["GRAD Survivable Crashes", "Crash Helicopter", {
    
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
    _position = ASLToAGL _position;

    private _vehicles = nearestObjects [_position, ["Air"], 2000, true];

    [_vehicles select 0] remoteExec ["GRAD_survivableCrash_fnc_onCrash", 2];

}] call zen_custom_modules_fnc_register;