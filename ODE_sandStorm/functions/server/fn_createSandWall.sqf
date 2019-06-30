/*

    createSandWall

    ["marker", _speed, _dir] call ODE_sandStorm_fnc_createSandWall;

*/

params ["_trigger", "_speed", "_dir"];

[_trigger] remoteExec ["ODE_sandStorm_fnc_addSandWallLocal", [0,-2] select isDedicated, true];

[{
    params ["_args", "_handle"];
    _args params ["_trigger", "_speed", "_dir"];

    if (isNull _trigger) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        systemChat "sandstorm: removing as marker is null";
    };

    private _newPos = (getPos _trigger) getPos [_speed, _dir];
    _trigger setPos _newPos;
    
}, 0, [_trigger, _speed, _dir]] call CBA_fnc_addPerFrameHandler;