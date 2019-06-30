// binding to the player object:
["setTFARFrequencyHandler", "OnRadiosReceived", {

	private _frequencySW = player getVariable ["GRAD_missionControl_frequencySW", "133.7"];
	private _frequencySWAdditional = player getVariable ["GRAD_missionControl_frequencySWAdditional", "133.8"];
	private _frequencyLR = player getVariable ["GRAD_missionControl_frequencyLR", "33.7"];

	private _swRadio = call TFAR_fnc_activeSwRadio;
	private _lrRadio = call TFAR_fnc_activeLrRadio;

	if (!(_swRadio isEqualTo "")) then {
		[_swRadio, _frequencySW] call TFAR_fnc_setSwFrequency;

		[_swRadio, 2, _frequencySWAdditional] call TFAR_fnc_SetChannelFrequency;
		[_swRadio, 1] call TFAR_fnc_setAdditionalSwChannel;
	};

	if  (!(count _lrRadio isEqualTo 0)) then {

		if (player getVariable ["isPOW", false]) then {
				_frequencyLR = "77";
		};

		[_lrRadio, _frequencyLR] call TFAR_fnc_setLrFrequency;
	};
	
}, player] call TFAR_fnc_addEventHandler;