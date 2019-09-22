titleText ["","BLACK FADED",999];
sleep 5;

playMusic "muse_high";

titleText ["", "BLACK IN", 15];
15 fadeSound 1;

_introPicBlack = findDisplay 46 ctrlCreate ["RscPicture", -1];
_introPicBlack ctrlSetPosition [
	safeZoneX,  
 	safezoneY,
 	safeZoneW,
 	safezoneH
];
_introPicBlack ctrlsetText "pic\intro2.paa";
_introPicBlack ctrlCommit 0;

sleep 25;

_introPicWhite = findDisplay 46 ctrlCreate ["RscPicture", -1];
_introPicWhite ctrlSetPosition [
	safeZoneX,  
 	safezoneY,  
 	safeZoneW,  
 	safezoneH
];
_introPicWhite ctrlsetText "pic\intro_black.paa";
_introPicWhite ctrlsetFade 1;
_introPicWhite ctrlCommit 0;

_introPicWhite ctrlsetFade 0;
_introPicWhite ctrlCommit 3;

_introPicBlack ctrlsetFade 1;
_introPicBlack ctrlCommit 6;

sleep 5;

_introPicWhite ctrlsetFade 1;
_introPicWhite ctrlCommit 10;

sleep 20;

// ml_mosque say3D ["muezzin", 1000];

if (typeOf player isEqualTo "B_officer_F") then {
	slot_platoonlead action ["WeaponOnBack", slot_platoonlead];
	//player action ["SwitchWeapon", player, player, 100];
};


sleep 70;

[ "B R I E F I N G", "26.11.2018" ] spawn BIS_fnc_infoText;

10 fadeMusic 0;
10 fadeSound 0;

sleep 10;

playMusic "";

/*

titleText ["", "BLACK OUT", 2];
5 fadeSound 0;

sleep 5;

titleText ["", "BLACK IN", 2];

5 fadeSound 1;
*/