/*

	creates emitter LOD (droprate) calculation trigger helper

*/


if (player getVariable ["ODE_LODTriggerCreated", false]) exitWith {};

player setVariable ["ODE_LODTriggerCreated", true];


// distance, multiplier of droprate
private _LODLevel =
[
	[500,[0.2, 0.3]],
	[1000,[0.5, 0.3]],
	[3500,[0.7, 0.5]],
	[7000,[1, 2]]
];



{
	private _size = _x select 0;

	private _trigger = createTrigger ["EmptyDetector", position player];
	_trigger setTriggerArea [_size, _size, 0, false];

	_trigger attachTo [player];

	private _identifier = format ["ODE_LODTrigger_%1", _forEachIndex];
	player setVariable [_identifier, _trigger];

} forEach _LODLevel;

player setVariable ["ODE_LODTriggerDefinitions", _LODLevel];