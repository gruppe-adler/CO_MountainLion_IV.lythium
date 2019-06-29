private _colorEffect = ppEffectCreate ["ColorCorrections",1500];
_colorEffect ppEffectEnable true;
_colorEffect ppEffectAdjust [0.875,0.875,-0.1,[1.652,0.764,0,0.2],[1,1,1,0.8],[0.835,0,0,0],[0,0,-0.265,-0.194,-0.017,0.279,0.624]];

// alternative color value
// ppEffectAdjust [1,1.02,-0.005,[0,0,0,0],[1,0.8,0.6,0.65],[0.199,0.587,0.115,0]];
_colorEffect ppEffectCommit 3;

_colorEffect
