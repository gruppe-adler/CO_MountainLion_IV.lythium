params ["_campos1", "_campos2", "_target1", "_target2", "_duration", "_transition", "_zoom1", "_zoom2", "_offset1", "_offset2"];
_offset1 params ["_offset1X", "_offset1Y", "_offset1Z"];
_offset2 params ["_offset2X", "_offset2Y", "_offset2Z"];

if (typeName _campos1 isEqualTo "OBJECT") then {
	_campos1 = getPosASL _campos1;
};

if (typeName _campos2 isEqualTo "OBJECT") then {
	_campos2 = getPosASL _campos2;
};

_campos1 params ["_pos1X", "_pos1Y", "_pos1Z"];
_campos2 params ["_pos2X", "_pos2Y", "_pos2Z"];

_campos1 set [0, _pos1X + _offset1X];
_campos1 set [1, _pos1Y + _offset1Y];
_campos1 set [2, _pos1Z + _offset1Z];

_campos2 set [0, _pos2X + _offset2X];
_campos2 set [1, _pos2Y + _offset2Y];
_campos2 set [2, _pos2Z + _offset2Z];

_camera = "camera" camCreate _campos1;
showCinemaBorder true;
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget _target1;
_camera camPrepareFOV _zoom1;
_camera camCommitPrepared 0;

// poz 2 - where camera is moving next - target2
_camera camPreparePos _campos2;
_camera camPrepareTarget _target2;
_camera camPrepareFOV _zoom2;

_camera camCommitPrepared _duration;
sleep _duration;