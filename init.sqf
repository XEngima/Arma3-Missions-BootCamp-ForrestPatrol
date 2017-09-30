call compile preprocessFileLineNumbers "Sqx\Markers\Init.sqx.sqf"; // Added by Sqx.Markers
call compile preprocessFileLineNumbers "Engima\PatrolledAreas\Init.sqf"; // Added by Engima.PatrolledAreas
call compile preprocessFileLineNumbers "Engima\CommonLib\CommonLib.sqf"; // Added by Engima.CommonLib

execVM "init.sqx.sqf";

dre_unit addEventHandler ["HandleDamage", {
	private _unit = _this select 0;
	private _hitdamage = _this select 2;
	
	if (_hitDamage + (getDammage _unit) >= 0.75) then
	{
		dre_unit setCaptive true;
		dre_unit playMove "AmovPercMstpSsurWnonDnon";
		dre_unit disableAI "ANIM";
	};
	
	0
}];
