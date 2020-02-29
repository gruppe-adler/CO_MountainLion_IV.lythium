params ["_screen"];

_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];

/* create camera and stream to render surface */
droneCam = "camera" camCreate [0,0,0];
droneCam cameraEffect ["Internal", "Back", "uavrtt"];

/* attach cam to gunner cam position */
droneCam attachTo [stage1_drone, [0,0,0], "commanderview"];

/* make it zoom in a little */
droneCam camSetFov 0.1;

/* switch cam to thermal */
"uavrtt" setPiPEffect [2];

/* adjust cam orientation */
addMissionEventHandler ["Draw3D", {
    private _dir = 
        (stage1_drone selectionPosition "laserstart") 
            vectorFromTo 
        (stage1_drone selectionPosition "commanderview");
    droneCam setVectorDirAndUp [
        _dir, 
        _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
    ];
}];