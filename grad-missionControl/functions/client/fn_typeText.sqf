/*
	Author: Jiri Wainar

	Description:
	Types a structured text on the screen, letter by letter, cursor blinking.

	Parameter(s):
	_this: array containing blocks of text with same structured text formatting

	Remarks:
	* Every text block is an array of text and formatting tag.
	* Blocks don't have to span over whole line.

	Example:

	[
		["CAMP ROGAIN,","<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
		["RESSUPLY POINT","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
		["10 MINUTES LATER ...","<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"]

	] spawn BIS_fnc_typeText;
*/

DELAY_CHARACTER	= 1;
DELAY_CURSOR = 0;
DELAY_BLOCK = 2;

private["_data","_posX","_posY","_rootFormat","_toDisplay"];
private["_blocks","_block","_blockCount","_blockNr","_blockArray","_blockText","_blockTextF","_blockTextF_","_blockFormat","_formats","_inputData","_processedTextF","_char","_cursorInvis","_blinkCounts","_blinkCount"];

_data 		= _this param [0, [], [[]]];
_posX 		= _this param [1, 0, [123]];
_posY 		= _this param [2, 0, [123]];
_rootFormat 	= _this param [3, "<t >%1</t>", [""]];

_blockCount = count _data;

_invisCursor = "<t color ='#00000000' shadow = '0'>_</t>";

//process the input data
_blocks 	= [];
_formats 	= [];
_blinkCounts 	= [];

{
	_inputData = _x;

	_block 		= _inputData param [0, "", [""]];
	_format 	= _inputData param [1, "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>", [""]];
	_blinkCount 	= _inputData param [2, 5, [123]];

	//convert strings into array of chars
	_blockArray = toArray _block;
	{_blockArray set [_forEachIndex, toString [_x]]} forEach _blockArray;

	_blocks  = _blocks + [_blockArray];
	_formats = _formats + [_format];
	_blinkCounts = _blinkCounts + [_blinkCount];
}
forEach _data;

//do the printing
_processedTextF  = "";

{
	_blockArray  = _x;
	_blockNr     = _forEachIndex;
	_blockFormat = _formats select _blockNr;
	_blockText   = "";
	_blockTextF  = "";
	_blockTextF_ = "";
	private _skipSound = false;

	if (_blockNr > 0) then {
		DELAY_CHARACTER = 0.05;
	};
	if (_blockNr isEqualTo 1) then {
		DELAY_CHARACTER = 0;
		DELAY_CURSOR = 0;
		_skipSound = true;
	};
	if (_blockNr isEqualTo 2) then {
		DELAY_CHARACTER = 0.05;
		DELAY_CURSOR = 0;
		_skipSound = true;
	};

	{
		_char = _x;

		_blockText = _blockText + _char;

		_blockTextF  = format[_blockFormat, _blockText + _invisCursor];
		_blockTextF_ = format[_blockFormat, _blockText + _invisCursor];

		//print the output
		_toDisplay = format[_rootFormat,_processedTextF + _blockTextF_];
		[_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;


		
		if (!(_char isEqualTo " ")) then {
			if (!_skipSound) then {
				playSound (selectRandom ["GRAD_heartbeat_slow_1","GRAD_heartbeat_slow_2"]);
			};
			sleep DELAY_CHARACTER;
		};
		_toDisplay = format[_rootFormat,_processedTextF + _blockTextF];
		[_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
		if (!(_char isEqualTo " ")) then {
			sleep DELAY_CURSOR;
		};
	}
	forEach _blockArray;



	_blinkCount = _blinkCounts select _forEachIndex;

	if (_blinkCount > 0) then
	{
		for "_i" from 1 to _blinkCount do
		{
			_toDisplay = format[_rootFormat,_processedTextF + _blockTextF_];
			[_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			sleep DELAY_CHARACTER;
			_toDisplay = format[_rootFormat,_processedTextF + _blockTextF];
			[_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			sleep DELAY_CURSOR;
		};
	};

	sleep DELAY_BLOCK;
	//store finished block
	_processedTextF  = _processedTextF + _blockTextF;
}
forEach _blocks;

_display = uinamespace getvariable "BIS_dynamicText";
_control = _display displayctrl 9999;
_control ctrlsetfade 0;
_control ctrlcommit 15;

sleep 15;

//clean the screen
["", _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;