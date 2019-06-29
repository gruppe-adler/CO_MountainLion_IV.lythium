
// Note: Only one script command induced weather change (either setOvercast or setFog) can be happening at a time.

[{
    setFog [0.23,0.021,60]; // set fog locally
}, 0, []] call CBA_fnc_addPerFrameHandler;
