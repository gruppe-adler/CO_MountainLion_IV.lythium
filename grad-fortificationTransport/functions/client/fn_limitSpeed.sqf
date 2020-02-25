// blatant rip from ace3/commy2

params ["_vehicle"];

private _driver = driver _vehicle;
private _speedLimit = 40;

if (player getVariable ["GRAD_fortificationTransport_limitSpeed", false]) exitWith {};

player setVariable ["GRAD_fortificationTransport_limitSpeed", true];

[{
    params ["_args", "_idPFH"];
    _args params ["_driver", "_vehicle", "_speedLimit"];

    private _isSpeedLimiter = false;
    
    if (_driver != driver _vehicle) then {
        _isSpeedLimiter = false;
    };

    if (!_isSpeedLimiter || isNull (_item getVariable ["GRAD_fortificationTransport_loadedOn", objNull])) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
        player setVariable ["GRAD_fortificationTransport_limitSpeed", false];
    };

    private _speed = speed _vehicle;

    if (_speed > _speedLimit) then {
        _vehicle setVelocity ((velocity _vehicle) vectorMultiply ((_speedLimit / _speed) - 0.00001));  // fix 1.42-hotfix PhysX libraries applying force in previous direction when turning
    };

}, 0, [_driver, _vehicle, _speedLimit]] call CBA_fnc_addPerFrameHandler;