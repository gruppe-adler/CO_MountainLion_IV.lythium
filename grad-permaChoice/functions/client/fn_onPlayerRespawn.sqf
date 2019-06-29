private _position = missionNameSpace getVariable ["ATAKA_RespawnPosition", [0,0,0]];

player setPos _position;

["Default" ,["", "Respawn für Nachbesprechung"]] call bis_fnc_showNotification;
