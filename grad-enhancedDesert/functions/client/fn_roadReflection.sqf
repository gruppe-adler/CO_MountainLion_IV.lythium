/*
    adapted from diwako
*/


private _max = 200;
private _maxIter = 10;
// private _streets = ["#GdtKlTarmac", "#GdtKlWeatheredTarmac"]; // todo add lythium roads

[{
    params ["_args", "_handle"];
    _args params ["_max", "_maxIter"];
   
    private _campos = positionCameraToWorld [0,0,0];
    private _roads = _campos nearRoads 150;
    private _cur = 0;

    _campos params ["_camX", "_camY", "_camZ"];
    // dont show effect from above/air and in nighttime
    // if ((_camZ > 10) || sunOrMoon == 1) exitWith {};


    private _player = ace_player;
    {
        private _roadPos = getpos _x;
        private _surfacetype = surfaceType _roadPos;
        if (_cur <= _max) then {
            // && {_streets findif {_surfacetype isEqualTo _x} > -1}
            private _connectedRoads = roadsConnectedTo _x;
            if !(_connectedRoads isEqualTo []) then {
                _connectedRoad = _connectedRoads select 0;
                private _dir = _x getDir _connectedRoad;

                _curIter = 0;
                for "_a" from 1 to 20 do {
                    if (_maxIter <= _curIter) exitWith {};
                    private _pos = [[_roadPos, 6, 50, _dir, true]] call CBA_fnc_randPosArea;
                    if ((_campos distance2D _pos) >= 50 && {_surfacetype isEqualTo (surfaceType _pos)}) then {
                        _pos = _pos vectorAdd [0,0,-0.5];
                        drop [
                            ["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, _pos, 
                            [0, 0, 0.25], 0, 11, 7.9, 0, [0.01, 5, 5, 0.01], [[0.1, 0.1, 0.1, 0.5]], [0.08], 1, 0, "", "", ""
                        ];
                        _cur = _cur + 1;
                        _curIter = _curIter + 1;
                    };
                };
            };
        };
    } forEach _roads;


}, 1, [_max, _maxIter]] call CBA_fnc_addPerFrameHandler;