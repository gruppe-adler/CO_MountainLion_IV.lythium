params ["_shot", "_index"];

_shot params [
	"_type",
	"_start",
	"_end",
	"_target1",
	"_target2",
	"_duration",
	"_transition",
	"_zoom1",
	"_zoom2",
	["_offset1",[0,0,0]],
	["_offset2",[0,0,0]],
	["_angle",1],
	["_radius",100],
	["_cclockwise", false]
];

private _isLastShot = _index isEqualTo (count (missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []]));

if (_isLastShot) then {
	[{
		cutText ["", "BLACK OUT", 3];
	}, (_duration - 3)] call CBA_fnc_waitAndExecute;
};

switch _type do {
	case "FREE": {
		// posStart, posEnd
		[_start, _end, _target1, _target2, _duration, _transition, _zoom1, _zoom2, _offset1, _offset2] call GRAD_introCam_fnc_camFree;
	};

	case "ATTACHED": {
		// posStart, posEnd
		[_start, _end, _target1, _target2, _duration, _transition, _zoom1, _zoom2, _offset1, _offset2] call GRAD_introCam_fnc_camAttached;
	};
	
	case "ROTATE": {
		// angleStart, angleEnd
		[_start, _end, _target1, _target2, _duration, _transition, _zoom1, _zoom2, _offset1, _offset2, _radius, _cclockwise] call GRAD_introCam_fnc_camRotate;
	};
	default {};
};

if (_isLastShot) then {
	missionNamespace setVariable ["GRAD_INTROCAM_DONE", true];
};