params ["_unit"];

_unit disableAI "ALL";
_unit enableAI "ANIM";

private _animations = selectRandom [
    ["ApanPknlMstpSnonWnonDnon_G01",
    "ApanPknlMstpSnonWnonDnon_G02",
    "ApanPknlMstpSnonWnonDnon_G03"],
    ["ApanPpneMstpSnonWnonDnon_G01",
    "ApanPpneMstpSnonWnonDnon_G02",
    "ApanPpneMstpSnonWnonDnon_G03"],
    ["Acts_CivilHiding_1",
    "Acts_CivilHiding_2"]
];
_unit playMoveNow selectRandom _animations;

_unit addEventHandler ["AnimDone", {
    if (alive _unit && !captive _unit)  then {
        _unit playMoveNow selectRandom _animations;
    };
}];