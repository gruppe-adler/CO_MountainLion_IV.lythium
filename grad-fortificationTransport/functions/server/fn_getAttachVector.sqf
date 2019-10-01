/*
taken from killzone kid
*/

params ["_object1", "_object2"];

private _vector = _object2 worldToModelVisual [0,0,0];

[
	_object2 worldToModelVisual vectorDirVisual _object1 vectorDiff _vector,
	_object2 worldToModelVisual vectorUpVisual _object1 vectorDiff _vector
]