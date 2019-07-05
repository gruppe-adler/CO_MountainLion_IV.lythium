call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";

BRIEFING_DONE = false;

if (isMultiplayer && !didJIP) then {
	titleText ["","BLACK FADED",999];
	0 fadeSound 0;
};

enableSentences false;
["BLU_F", "USOCP"] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", "Taliban"] call GRAD_Loadout_fnc_FactionSetLoadout;
["CIV_F", "Taliban"] call GRAD_Loadout_fnc_FactionSetLoadout;

execVM "grad_rotorwash\init.sqf";