params ["_vehicle"];

if (!(player in _vehicle)) exitWith {};

addCamShake [10, 2, 9];

playSound "tingle";
playSound "wind";

[{
    params ["_args", "_handle"];
    _args params ["_vehicle"];

    if (isTouchingGround _vehicle) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

     playSound "tingle";
     addCamShake [10, 2, 9];

}, 9, [_vehicle]] call CBA_fnc_addPerFrameHandler;

[{
    params ["_args", "_handle"];
    _args params ["_vehicle"];

    if (isTouchingGround _vehicle) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

     playSound "wind";

}, 26, [_vehicle]] call CBA_fnc_addPerFrameHandler;