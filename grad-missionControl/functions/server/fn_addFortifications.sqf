params ["_vehicle"];

[{
    params ["_vehicle"];
    [_vehicle,"Land_CncBarrier_stripes_F",6] call grad_fortifications_fnc_addFort;
    [_vehicle,"Land_CncBarrierMedium_F",4] call grad_fortifications_fnc_addFort;
    [_vehicle,"RoadBarrier_F",4] call grad_fortifications_fnc_addFort;

    [_vehicle,"CUP_SignT_Stop",2] call grad_fortifications_fnc_addFort;
    [_vehicle,"RoadBarrier_small_F",2] call grad_fortifications_fnc_addFort;

    [_vehicle,"RoadCone_L_F",2] call grad_fortifications_fnc_addFort;
    [_vehicle,"RoadCone_F",10] call grad_fortifications_fnc_addFort;

    [_vehicle,"Sign_Checkpoint_TK_EP1",2] call grad_fortifications_fnc_addFort;


    [_vehicle,"Land_GuardShed",2] call grad_fortifications_fnc_addFort;

    [_vehicle,"Flag_NATO_F",1] call grad_fortifications_fnc_addFort;
    [_vehicle,"Flag_UK_F",1] call grad_fortifications_fnc_addFort;
    [_vehicle,"FlagCarrierGermany_EP1",1] call grad_fortifications_fnc_addFort;
}, [_vehicle], 5] call CBA_fnc_waitAndExecute;