params ["_vehicle"];

private _wheels = [
		"wheel_1_1_steering",
		"wheel_1_2_steering",
		"wheel_1_3_steering",
		"wheel_1_4_steering",
		"wheel_2_1_steering",
		"wheel_2_2_steering",
		"wheel_2_3_steering",
		"wheel_2_4_steering"
];

{
	if (random 2 > 1) then {
		_vehicle setHit [_x, 1];
	};
} forEach _wheels;