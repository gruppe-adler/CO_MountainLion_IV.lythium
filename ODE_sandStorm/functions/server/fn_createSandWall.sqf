/*

    createSandWall

    [[10217.7,2833.75,0], 2, 285] call ODE_sandStorm_fnc_createSandWall;

*/

params ["_position", "_size", "_speed", "_dir"];

private _trigger = createTrigger ["EmptyDetector", _position];
_trigger setTriggerArea [_size, _size, 0, false];

private _helperObject = "Land_PenBlack_F" createVehicle _position;
 _trigger attachTo [_helperObject];

[_trigger, _helperObject] remoteExec ["ODE_sandStorm_fnc_addSandWallLocal", [0,-2] select isDedicated, true];

0 setWindDir _dir;
private _wSpeed = [wind, _speed*20] call BIS_fnc_vectorMultiply;
setWind [_wSpeed select 0, _wSpeed select 1, true];
// 5 setGusts 0.35;

private _markerstr = createMarker ["markername", _position];
_markerstr setMarkerShape "ELLIPSE";
_markerstr setMarkerSize [_size, _size];
_markerstr setMarkerColor "ColorRed";
_markerstr setMarkerAlpha 0.5;


private _soundSource = createSoundSource ["desertLoop", position _trigger, [], 0]; 

[{
    params ["_args", "_handle"];
    _args params ["_helperObject", "_soundSource", "_speed", "_dir", "_markerstr"];

    if (isNull _helperObject) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        systemChat "sandstorm: removing as marker is null";
    };

    private _newPos = (getPos _helperObject) getPos [_speed, _dir];
    _helperObject setPos _newPos;
    _soundSource setPos _newPos;
    _markerstr setMarkerPos _newPos;

    _newPos params ["_xPos", "_yPos"];
    
    if (_xPos < 0 || _xPos > worldSize || _yPos < 0 || _yPos > worldSize) then {
        deleteVehicle _helperObject;
        systemChat "deleting trigger out of map";
    };
    
}, 1, [_helperObject, _soundSource, _speed, _dir, _markerstr]] call CBA_fnc_addPerFrameHandler;