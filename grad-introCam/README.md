# grad-introCam

aliascartoons intro script inspired me to a complete refactoring/rewriting.

planning to implement further features (text effects etc) too


# How To
1. Put grad-introCam in your mission root.

2. Include cfgFunctions in your description.ext like this
```
class cfgFunctions {
	#include "grad-introCam\cfgFunctions.hpp"	
};
```

3. Add cam shot definitions to grad-introCam\functions\server\fn_shotDefinitions.sqf

You can add as many as you like. There are currently three different camera types:
"FREE" - moves between two points
"ATTACHED" - moves along with a vehicle/unit
"ROTATE" - rotates around a point/unit/vehicle

You can define start/end position, camTarget, duration of camera shot, start/end fov (smaller is more zoom) and camera offset. Rotation takes some different parameters, just check the example.

["FREE", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
["ATTACHED", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
["ROTATE", angleStart, angleEnd, target, duration, fov1, fov2, radius (int), cclockwise (bool)]