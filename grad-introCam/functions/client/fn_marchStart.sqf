
if (!isServer) exitWith {};

private _units = units group march_leader;

_units spawn
{
	private _speed = 0.4; // m/s
	{
		_x setDir 193;
		_x moveTo (getPos intro_march2);
		_x setVelocity [(sin (getDir march_leader))*_speed, (cos (getDir march_leader))*_speed, 0];
		_x playmove "AmovPercMwlkSnonWnonDf"; 
		_x addEventHandler ["AnimDone", {_this select 0 playMove "AmovPercMwlkSnonWnonDf"}];
	}
	forEach _this;
};