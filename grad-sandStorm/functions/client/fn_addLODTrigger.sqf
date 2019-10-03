/*

	creates emitter LOD (droprate) calculation trigger helper

*/


if (player getVariable ["GRAD_sandstorm_LODTriggerCreated", false]) exitWith {};

player setVariable ["GRAD_sandstorm_LODTriggerCreated", true];


// distance, multiplier of droprate
private _LODLevel =
[
	[500,[0.2, 0.2]],
	[1000,[0.4, 0.4]],
	[2000,[0.6, 0.4]],
	[3500,[0.9, 0.5]],
	[7000,[2, 2]]
];

// [500,[0.2, 0.2]],

{
	private _size = _x select 0;

	private _trigger = createTrigger ["EmptyDetector", position player];
	_trigger setTriggerArea [_size, _size, 0, false];

	_trigger attachTo [player];

	private _identifier = format ["GRAD_sandstorm_LODTrigger_%1", _forEachIndex];
	player setVariable [_identifier, _trigger];

} forEach _LODLevel;

player setVariable ["GRAD_sandstorm_LODTriggerDefinitions", _LODLevel];