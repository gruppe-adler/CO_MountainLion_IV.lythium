params ["_vehicle"];

if (isEngineOn _vehicle && (_vehicle isKindOf "Helicopter") && {!(_vehicle getVariable ["GRAD_survivableCrash_shotDown", false])}) then {

    private _damage = _vehicle getHitPointDamage "HitEngine";

    if (_damage < 0.8) then {
        _damage = _damage + 0.02;
        _vehicle setHitPointDamage ["HitEngine", _damage];
    } else {
    	[_x] call GRAD_survivableCrash_fnc_onCrash;
	};
};