player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];

    if (typeOf _vehicle == "UK3CB_BAF_MAN_HX58_Cargo_Sand_A_DDPM_RM") then {
        [_vehicle] call GRAD_fortificationTransport_fnc_limitSpeed;
    };
}];