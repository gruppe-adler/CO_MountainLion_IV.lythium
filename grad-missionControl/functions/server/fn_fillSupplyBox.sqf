params ["_box"];

if (!isServer) exitWith {};

// default mags
_box addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", 100];

// AT
_box addMagazineCargoGlobal ["rhs_mag_maaws_HEDP", 5];
_box addMagazineCargoGlobal ["rhs_mag_maaws_HE", 5];
_box addMagazineCargoGlobal ["rhs_mag_maaws_HEAT", 5];

// MG
_box addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer", 20];
_box addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 20];


// pilot MP
_box addMagazineCargoGlobal ["rhsusf_mag_40Rnd_46x30_AP", 20];


// smokes
_box addMagazineCargoGlobal ["SmokeShell", 20];
_box addMagazineCargoGlobal ["SmokeShellPurple", 20];
_box addMagazineCargoGlobal ["SmokeShellRed", 20];
_box addMagazineCargoGlobal ["SmokeShellYellow", 20];
_box addMagazineCargoGlobal ["SmokeShellGreen", 20];
_box addMagazineCargoGlobal ["SmokeShellBlue", 20];
_box addMagazineCargoGlobal ["SmokeShellOrange", 20];
_box addMagazineCargoGlobal ["HandGrenade", 20];


// sniper
_box addMagazineCargoGlobal ["rhsusf_5Rnd_300winmag_xm2010", 30];

// additional AT
_box addWeaponCargoGlobal ["rhs_weap_M136", 5];

// entrenching
_box addItemCargoGlobal ["ACE_entrenchingTool", 10];
_box addItemCargoGlobal ["ACE_TacticalLadder_Pack", 3];


_box addWeaponCargoGlobal ["ACE_VMH3", 3];
