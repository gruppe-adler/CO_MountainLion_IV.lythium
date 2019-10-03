params ["_item", "_vehicle"];

_item setVariable ["GRAD_fortificationTransport_cargoVector", [[0.000263007,0.982178,0.187953],[-0.00398204,-0.18795,0.982171]], true];
_item setVariable ["GRAD_fortificationTransport_cargoPos", [-0.0625,0.61792,-3.92987], true];

[_vehicle, _item] call GRAD_fortificationTransport_fnc_addInteraction;