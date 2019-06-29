params ["_unit", "_state"];

if _state then {
    // hint str (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]);
  	_Wasted = (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]) ctrlCreate ["RscStructuredText",1930];
  	_Wasted ctrlSetPosition  [-0.000156274 * safezoneW + safezoneX,0.423 * safezoneH + safezoneY,1.02094 * safezoneW,0.099 * safezoneH];
  	_Wasted ctrlCommit 0;
  	_Wasted ctrlSetBackgroundColor [0, 0, 0, 0.9];
  	_Wasted ctrlSetStructuredText parseText format["<t size='4' color='#FF0000' align = 'center'>Auf Hilfe warten oder:</t>"];


    _rspbutton = (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]) ctrlCreate ["RscButton",1931];
  	_rspbutton ctrlSetPosition [0.5 * safezoneW + safezoneX,0.533 * safezoneH + safezoneY,0.195937 * safezoneW,0.077 * safezoneH];
  	_rspbutton ctrlCommit 0;
  	_rspbutton ctrlSetBackgroundColor [0, 0, 0, 0.7];
  	_rspbutton ctrlSetText "Aufgeben und als Opfor respawnen.";
  	_rspbutton ctrlAddEventHandler ["ButtonClick", "player setVariable ['ODE_respawnSystem_respawnDecision', 'opfor']; closeDialog 0; player setDamage 1;"];


    _reqMedic = (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]) ctrlCreate ["RscButton",1932];
  	_reqMedic ctrlSetPosition [0.304062 * safezoneW + safezoneX,0.533 * safezoneH + safezoneY,0.190781 * safezoneW,0.077 * safezoneH];
  	_reqMedic ctrlCommit 0;
  	_reqMedic ctrlSetBackgroundColor [0, 0, 0, 0.7];
  	_reqMedic ctrlSetText "Aufgeben und in den Spectator gehen.";
  	_reqMedic ctrlAddEventHandler ["ButtonClick", "player setVariable ['ODE_respawnSystem_respawnDecision', 'spectator']; closeDialog 0; player setDamage 1;"];
} else {
    //hint "state false";
};
