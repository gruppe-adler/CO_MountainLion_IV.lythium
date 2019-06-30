params ["_position"];

private _type = selectRandom ["RHS_Ural_Civ_02",
"RHS_Ural_Civ_01",
"RHS_Ural_Open_Civ_01",
"RHS_Ural_Civ_03",
"RHS_Ural_Open_Civ_02",
"RHS_Ural_Open_Civ_03",
"rhsgref_un_ural",
"rhsgref_nat_ural_open",
"rhsgref_nat_ural",
"rhs_zil131_vdv",
"rhs_zil131_open_vdv"];

private _group = createGroup east;

private _vehicle = createVehicle [_type, _position, [], 0, "NONE"];
_group addVehicle _vehicle;

private _unit = _group createUnit ["O_Soldier_F", [0,0,0], [], 0, "NONE"];
[_unit, true] call GRAD_civPartisans_fnc_equip;

_unit assignAsDriver _vehicle;
_unit moveInDriver _vehicle;

for "_i" from 0 to 9 do {

	private _unit = _group createUnit ["O_Soldier_F", [0,0,0], [], 0, "CARGO"];
    [_unit, true] call GRAD_civPartisans_fnc_equip;

    /*
    _unit assignAsCargo _vehicle;
    _unit moveInCargo _vehicle;
    */

};