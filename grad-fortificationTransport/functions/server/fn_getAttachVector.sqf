/*
taken from killzone kid
*/

params ["_object1", "_object2"];

private _vector = _object2 worldToModelVisual [0,0,0];

[
	_object2 worldToModelVisual vectorDirVisual _object1 vectorDiff _vector,
	_object2 worldToModelVisual vectorUpVisual _object1 vectorDiff _vector
]

/*
 
1) (getPos b1) vectorDiff (getPos t1) - box zu truck  // [-0.669434,-5.2395,3.38529]
2) (getPos t1) vectorAdd [-0.669434,-5.2395,3.38529]
box setzen und attachen ohne was

*/