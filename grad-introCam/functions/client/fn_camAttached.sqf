params ["_campos1", "_object", "_target1", "_target2", "_duration", "_zoom1", "_zoom2", ["_offset",[0,0,0]]];
_offset params ["_offsetX", "_offsetY", "_offsetZ"];

if (typeName _campos1 isEqualTo "OBJECT") then {
	_campos1 = getPos _campos1;
};

_camera = "camera" camCreate _campos1;
_camera camSetFov _zoom1;
showCinemaBorder true;
_camera attachTo [_object, [_offsetX,_offsetY,_offsetZ]];		
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget _target1;
 _camera camPrepareFOV _zoom1;
_camera camCommitPrepared _duration;
sleep _duration;

/*
_camera = "camera" camCreate (getpos _campos1);
showCinemaBorder true;
_camera attachTo [_object, [_x_coord,_y_coord,_z_coord]];		
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget _targetcam;
_camera camPrepareFOV _zoom_level1;
_camera camCommitPrepared _camera_duration;
sleep _camera_duration;
*/