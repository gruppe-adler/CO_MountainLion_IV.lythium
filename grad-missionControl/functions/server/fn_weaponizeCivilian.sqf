params ["_unit", ["_group", grpNull]];

[_unit, "rhs_weap_pm63", 5, "rhs_30Rnd_762x39mm_89"] call BIS_fnc_addWeapon;

if (isNull _group) then {
    private _group = createGroup east;
    [_unit] joinSilent _group;
} else {
    [_unit] joinSilent _group;
};