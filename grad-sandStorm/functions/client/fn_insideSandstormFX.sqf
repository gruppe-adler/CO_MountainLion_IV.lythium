params ["_vehicle", "_fogvalue", "_duration"];

if (_vehicle isKindOf "Air" && {(getPos _vehicle) select 2 > 0}) then {
	// not in sync
	addCamShake [random 0.01 + 0.01, _duration, 5 + random 2];
};

// in sync
1 setFog [_fogvalue,0.003,0];