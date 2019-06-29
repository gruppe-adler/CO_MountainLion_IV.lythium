#include "\z\ace\addons\main\script_component.hpp"

params ["_targetMarker"];

private _location = getMarkerPos _targetMarker;

["Respawning as Opfor"] call EFUNC(common,displayTextStructured);

cutText ["", "BLACK OUT", 0.1];

_spawn = _location findEmptyPosition[2, 20, "B_Soldier_F"];
diag_log format ["teleporting %1 to %2.", player, _location];

sleep 1;
_nul = player setPos _spawn;
openMap [false, false];
hintSilent "";
sleep 2;
cutText ["", "BLACK IN", 1];

// 3 call fn_sthud_usermenu_changeMode;
sleep 1;
cutText ["", "PLAIN"];
