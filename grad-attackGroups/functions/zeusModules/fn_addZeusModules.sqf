[
	"GRAD Attack Groups",
	"Spawn Motorized Reinforcements", 
	{ 
	params ["_modulePosition"]; 
	[_modulePosition] spawn GRAD_attackGroups_fnc_spawnMotorizedAttackGroup;  
	}
] call zen_custom_modules_fnc_register;


["GRAD Attack Groups", "Spawn Bunker Patrol", {

	["GRAD Bunker Patrol", [
		[
			"COMBO",
			["Start Position", "Bunker, where units will spawn"],
			[
				[
					selectRandom [Bunker1Pos1, Bunker1Pos2],
					Bunker2Pos1,
					Bunker3Pos1
				],
				[
					["Bunker North"],
					["Bunker East"],
					["Bunker South"]
				],
				1
			],
			true
		],
		[
			"SLIDER",
			["Waypoint Distance", "Waypoint distance to Crash site"],
			[50, 1000, 150, 0],
			true
		],
		[
			"SLIDER",
			["Number of Waypoints", "Number of Waypoints, making up the Patrol Route"],
			[5, 15, 5, 0],
			true
		],
		[
			"SLIDER",
			["Size of Group", "The amount of units in the Patrol Group"],
			[2, 20, 5, 0],
			true
		]		
	], {
		params ["_dialogValues", "_args"];

		_dialogValues params [
			"_bunker",
			"_radius",
			"_amount",
			"_groupSize"
		];
		
		[_bunker, _radius, _amount, _groupSize] remoteExec ["GRAD_attackGroups_fnc_spawnBunkerPatrol", 2];
	}, {}, []] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;


["GRAD Attack Groups", "Spawn Bunker Attack", {

	["GRAD Bunker Attack", [
		[
			"COMBO",
			["Start Position", "Bunker, where units will spawn"],
			[
				[
					selectRandom [Bunker1Pos1, Bunker1Pos2],
					Bunker2Pos1,
					Bunker3Pos1
				],
				[
					["Bunker North"],
					["Bunker East"],
					["Bunker South"]
				],
				1
			],
			true
		],
		[
			"SLIDER",
			["Waypoint placement", "Random waypoint placement within value in meters"],
			[0, 1000, 30, 0],
			true
		],
		[
			"SLIDER",
			["Size of Group", "The amount of units in the Attack Group"],
			[2, 20, 5, 0],
			true
		],
		[
			"COMBO",
			["Group formation", "Formation the group will switch to, during the attack"],
			[
				[
					"COLUMN",
					"STAG COLUMN",
					"WEDGE",
					"ECH LEFT",
					"ECH RIGHT",
					"VEE",
					"DIAMOND",
					"LINE"
				],
				[
					["Column"],
					["Staggered Column"],
					["Wedge"],
					["Echelon Left"],
					["Echelon Right"],
					["Vee"],
					["Diamond"],
					["Line"]
				],
				2
			],
			true
		],
		[
			"COMBO",
			["Position", "The Position that will be attacked"],
			[
				[
					"CRASHSITE",
					"NEARESTPLAYER",
					"NEARESTPLAYERCRASHSITE"
				],
				[
					["Crash Site"],
					["Nearest Player"],
					["Nearest Player at Crash Site"]
				],
				0
			],
			true
		]						
	], {
		params ["_dialogValues", "_args"];

		_dialogValues params [
			"_bunker",
			"_radius",
			"_groupSize",
			"_formation",
			"_attackPosition"
		];
		
		[_bunker, _radius, _groupSize, _formation, _attackPosition] remoteExec ["GRAD_attackGroups_fnc_spawnBunkerAttack", 2];
	}, {}, []] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;


["GRAD Attack Groups", "Spawn Bunker Attack Waves", {

	["GRAD Bunker Attack Waves", [
		[
			"COMBO",
			["Start Position", "Either all Bunkers, a random Bunker per wave, or a specific Bunker where units will spawn"],
			[
				[
					"ALLBUNKERS",
					"RANDOMBUNKERS",
					selectRandom [Bunker1Pos1, Bunker1Pos2],
					Bunker2Pos1,
					Bunker3Pos1
				],
				[
					["All Bunkers"],
					["Random Bunkers"],
					["Bunker North"],
					["Bunker East"],
					["Bunker South"]
				],
				1
			],
			true
		],
		[
			"SLIDER",
			["Wave Interval", "Time in seconds, between each wave"],
			[30, 600, 180, 0],
			true
		],
		[
			"SLIDER",
			["Amount of Waves", "The amount of Waves that will be spawned"],
			[1, 15, 5, 0],
			true
		],		
		[
			"SLIDER",
			["Max. Group Size", "The max. amount of units per Attack Group"],
			[2, 20, 6, 0],
			true
		],
		[
			"CHECKBOX",
			["Fixed Group Size", "If the Group Size is fixed, the amount of units per Attack Group will always be equal to Max. Group Size"],
			[false],
			true
		],		
		[
			"COMBO",
			["Group formation", "Formation the Attack Groups will switch to, during the attack"],
			[
				[
					"RANDOM",
					"COLUMN",
					"STAG COLUMN",
					"WEDGE",
					"ECH LEFT",
					"ECH RIGHT",
					"VEE",
					"DIAMOND",
					"LINE"
				],
				[
					["Random"],
					["Column"],
					["Staggered Column"],
					["Wedge"],
					["Echelon Left"],
					["Echelon Right"],
					["Vee"],
					["Diamond"],
					["Line"]
				],
				0
			],
			true
		],
		[
			"COMBO",
			["Wave Target", "The target of each wave"],
			[
				[
					"CRASHSITE",
					"NEARESTPLAYER",
					"NEARESTPLAYERCRASHSITE"
				],
				[
					["Crash Site"],
					["Nearest Player"],
					["Nearest Player at Crash Site"]
				],
				0
			],
			true
		]						
	], {
		params ["_dialogValues", "_args"];

		_dialogValues params [
			"_bunker",
			"_interval",
			"_waveAmount",
			"_groupSize",
			"_fixedSize",
			"_formation",
			"_attackPosition"
		];
		
		[_bunker, _interval, _waveAmount, _groupSize, _fixedSize, _formation, _attackPosition] remoteExec ["GRAD_attackGroups_fnc_spawnBunkerAttackWaves", 2];
	}, {}, []] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;