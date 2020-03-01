params ["_bunker", "_interval", "_waveAmount", "_groupSize", "_fixedSize", "_formation", "_attackPosition"];

switch (_bunker) do {
	
	case "ALLBUNKERS": { 
		private _increment = 0;
		private _actualGroupSize = _groupSize;
		private _actualFormation = _formation;
		while {_increment < _waveAmount} do {

			if !(_fixedSize) then {
				_actualGroupSize = random [2, round (_groupSize / 2), _groupSize];
			};
			if (_formation isEqualTo "RANDOM") then {
				_actualFormation = selectRandom ["COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "DIAMOND", "LINE"];
			};

			[selectRandom [Bunker1Pos1, Bunker1Pos2], 50, _actualGroupSize, _actualFormation, _attackPosition] call GRAD_attackGroups_fnc_spawnBunkerAttack;
			[Bunker2Pos1, 50, _actualGroupSize, _actualFormation, _attackPosition] call GRAD_attackGroups_fnc_spawnBunkerAttack;
			[Bunker3Pos1, 50, _actualGroupSize, _actualFormation, _attackPosition] call GRAD_attackGroups_fnc_spawnBunkerAttack;
			_increment = _increment + 1;
			sleep _interval;
		};
	};

	case "RANDOMBUNKERS": {
		private _increment = 0;
		private _actualGroupSize = _groupSize;
		private _actualFormation = _formation;
		while {_increment < _waveAmount} do {

			if !(_fixedSize) then {
				_actualGroupSize = random [2, round (_groupSize / 2), _groupSize];
			};
			if (_formation isEqualTo "RANDOM") then {
				_actualFormation = selectRandom ["COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "DIAMOND", "LINE"];
			};

			[selectRandom [selectRandom [Bunker1Pos1, Bunker1Pos2], Bunker2Pos1, Bunker3Pos1], 50, _actualGroupSize, _actualFormation, _attackPosition] call GRAD_attackGroups_fnc_spawnBunkerAttack;
			_increment = _increment + 1;
			sleep _interval;	
		};	
	};

	default {
		private _increment = 0;
		private _actualGroupSize = _groupSize;
		private _actualFormation = _formation;
		while {_increment < _waveAmount} do {

			if !(_fixedSize) then {
				_actualGroupSize = random [2, round (_groupSize / 2), _groupSize];
			};
			if (_formation isEqualTo "RANDOM") then {
				_actualFormation = selectRandom ["COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "DIAMOND", "LINE"];
			};

			[_bunker, 50, _actualGroupSize, _actualFormation, _attackPosition] call GRAD_attackGroups_fnc_spawnBunkerAttack;
			_increment = _increment + 1;
			sleep _interval;
		};
	};
};

private _allCuratorsVariable = [];
{
	_allCuratorsVariable pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;

[format["All %1 waves have been spawned!", round _waveAmount]] remoteExec ["systemChat", _allCuratorsVariable];