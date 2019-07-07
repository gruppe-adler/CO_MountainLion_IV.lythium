params ["_type"];

private _dropInterval = 0.1;


switch (_type) do { 
	case "borderBottom" : { 
		_dropInterval = 0.1;
	}; 
	
	case "borderTop" : { 
		_dropInterval = 0.1;
	};

	case "close": {
		_dropInterval = 0.1;
	};

	case "filler": {
		_dropInterval = 0.1;
	};
	
	default { 
		hint "error: no circle emitter type defined";
		diag_log format ["error: no circle emitter type defined"];
	}; 
};

_dropInterval