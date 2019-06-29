params ["_decision"];

switch (_decision) do {

    case "opfor": {
        player joinSilent (createGroup east);
        [] call ODE_respawnSystem_fnc_equipAsOpfor;
        [] call ODE_objectives_fnc_createTaskOpfor;
        ["mrk_spawn_opfor"] spawn ODE_respawnSystem_fnc_teleport;
    };

    case "spectator": {
        [[0,1,2],[]] call ace_spectator_fnc_updateCameraModes;
        [[west,east,independent,civilian], []] call ace_spectator_fnc_updateSides;

        [true] call ace_spectator_fnc_setSpectator;
        [player, true] call TFAR_fnc_forceSpectator;
    };

    default {};
};
