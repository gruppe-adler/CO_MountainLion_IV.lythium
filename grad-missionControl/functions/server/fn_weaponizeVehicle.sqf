params ["_vehicle"];

// diag_log str _vehicle;
// hint str _vehicle;

private _group = createGroup east;

if ((vehicle _vehicle) isKindOf "Car") then {
    // hint str crew _vehicle;
    {
        // diag_log (str _x);
        [_x, _group] call GRAD_missionControl_fnc_weaponizeCivilian;
    } forEach crew _vehicle;

} else {
    [_vehicle, _group] call GRAD_missionControl_fnc_weaponizeCivilian;
};