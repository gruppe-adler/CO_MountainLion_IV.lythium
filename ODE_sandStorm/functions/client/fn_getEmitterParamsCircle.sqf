params ["_type"];

private _params = [];


switch (_type) do { 
	case "borderBottom" : { 
		_params = [2,[0,0,0]];
	}; 
	
	case "borderTop" : { 
		_params = [2,[0,0,0]];
	};

	case "close": {
		_params = [5,[0,0,0]];
	};

	case "filler": {
		_params = [0,[0,0,0]];
	};
	
	default { 
		hint "error: no circle emitter type defined";
		diag_log format ["error: no circle emitter type defined"];
	}; 
};

_params