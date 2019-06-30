params ["_groupLeader"];

private _cleanUpveh = vehicle leader _groupLeader; 
private _group = group _groupLeader; 
{deleteVehicle _x} forEach crew _cleanUpveh + [_cleanUpveh]; 
deleteGroup _group;