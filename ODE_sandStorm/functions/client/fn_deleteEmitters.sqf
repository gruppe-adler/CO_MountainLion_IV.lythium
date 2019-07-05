private _allEmittersBorder = missionNamespace getVariable ["sandstormEmittersBorder", []];
private _allEmittersClose = missionNamespace getVariable ["sandstormEmittersClose", []];
private _allEmitters = _allEmittersBorder + _allEmittersClose;

 {
    private _emitters = _x;
    {
          deleteVehicle _x;
    } forEach _emitters;  
} forEach _allEmitters;

missionNamespace setVariable ["sandstormEmittersBorder", []];
missionNamespace setVariable ["sandstormEmittersClose", []];