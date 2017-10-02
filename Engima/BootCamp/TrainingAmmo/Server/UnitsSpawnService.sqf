while { true } do {
	{
		private _inTrainingMode = _x getVariable ["ENG_BOOTCAMP_InTrainingMode", false];
		
		if (!_inTrainingMode) then
		{
			_x addEventHandler ["HandleDamage", {
				private _unit = _this select 0;
				private _hitdamage = _this select 2;
				
				private _totalDamage = _hitDamage + (getDammage _unit);
				
				if (_totalDamage >= 0.75) then
				{
					_unit setCaptive true;
					_unit playMove "AmovPercMstpSsurWnonDnon";
					_unit disableAI "ANIM";
				};
				
				_hitDamage
			}];
			
			_x setVariable ["ENG_BOOTCAMP_InTrainingMode", true, false];
		};
	} foreach allUnits;

	sleep 1;
};
