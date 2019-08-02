/*
    
    grain effect, sound volume, camshake inside and outside vehicles/buildings

*/

params ["_duration"];

private _inBuilding = [] call GRAD_sandstorm_fnc_inBuilding;
private _ppGrain = player getVariable ["isInsideSandstormPP", [objNull,objNull]];
private _vehicleState = [player] call TFAR_fnc_isTurnedOut;

private _vehicle = objectParent player;
private _inVehicle = _vehicleState > 2;


private _shakepower = 1 + random 0.5;
private _shakeduration = _duration;
private _shakefreq = 3 + random 1;

private _originalVolume = 1;

if (_vehicleState > 1) then {
    if (_inVehicle) then {
        // Covered vehicle - attenuate sound, reduce camshake and film grain and particles
        // {if (typeOf _x == "#particlesource") then {deleteVehicle _x}} forEach (vehicle player nearObjects 10);
        // todo: widen radius of particle sources to not interfere
        if (_vehicle isKindOf "Air" && {(getPos _vehicle) select 2 > 0}) then {
            // not in sync
            addCamShake [(_shakepower), _shakeduration, _shakefreq];
        } else {
            addCamShake [(_shakepower/4), _shakeduration, _shakefreq];
        };
        0.1 fadeSound 0.55;
        _ppGrain ppEffectAdjust [0.08, 1.25, -0.01, 0.75, 1, 0];
        _ppGrain ppEffectCommit 1;
    } else {
        // Open vehicle - slight attenuation, reduce camshake, normal film grain
        addCamShake [(_shakepower/2), _shakeduration, _shakefreq];
        0.1 fadeSound 0.85;
        _ppGrain ppEffectAdjust [0.08, 1.25, -0.01, 0.75, 1, 0];
        _ppGrain ppEffectCommit 1;
    };
};

if (_inBuilding) then {
    // In building - reduce particles
    // {if (typeOf _x == "#particlesource") then {deleteVehicle _x}} forEach (player nearObjects 10);
    // widen particle radius so they dont interfere with house
    enableCamShake false;
    _ppGrain ppEffectAdjust [0.08, 1.25, 1.0, 0.75, 1, 0];
    _ppGrain ppEffectCommit 1;

    0.2 fadeSound 0.50;

    {if (_building animationPhase _x > 0.2) then {nearestdoor = _x}} forEach _doors;

    if (_building animationPhase nearestdoor < 0.2) then {
        doorclosed = true;
        0 fadeSound 0.40;
    } else {
        doorclosed = false;
        0 fadeSound 0.50;
    };
};

if (_vehicleState == 1 && !_inBuilding) then {
    // Player wearing eyewear adjust film grain
    if (goggles player != "") then {
        _ppGrain ppEffectAdjust [0.08, 1.25, 1.0, 0.75, 1, 0];
        _ppGrain ppEffectCommit 1;
    } else {
        _ppGrain ppEffectAdjust [0.08, 1.25, 2.05, 0.75, 1, 0];
        _ppGrain ppEffectCommit 1;
    };
    enableCamShake true;
    addCamShake [_shakepower, _shakeduration, _shakefreq];
    0.1 fadeSound _originalVolume;
};