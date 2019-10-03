params ["_unit", ["_chair", objNull]];

if (!isServer) exitWith {};
    
_unit disableAI "ALL";
_unit enableAI "ANIM";

[_unit, "HubSittingChairC_idle1"] remoteExec ["switchMove", 0]; 

_unit addEventHandler ["AnimDone", {
    params ["_unit"];

    _unit setVariable ["AnimDoneHandler", _thisEventHandler, true];

    if (!alive _unit) exitWith {
        _unit removeEventHandler ["AnimDone", _thisEventHandler];
        //hint "removed";
    };

    [_unit, "HubSittingChairC_idle1"] remoteExec ["switchMove", 0]; 
}];

_unit addMPEventHandler ["MPHit", {
    params ["_unit"];

    _unit removeAllEventHandlers "AnimDone";    
    _unit removeAllMPEventHandlers "MPHit";
    _unit setDamage 1;
}];

// if (isServer) then { _unit attachTo [_chair] };