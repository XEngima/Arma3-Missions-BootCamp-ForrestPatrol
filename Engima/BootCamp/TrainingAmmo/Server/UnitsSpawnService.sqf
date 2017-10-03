while { true } do {
	{
		private _unitInTrainingMode = _x getVariable ["ENG_BOOTCAMP_InTrainingMode", false];
		
		if (!_unitInTrainingMode) then
		{
			_x addEventHandler ["HandleDamage", {
				private _unit = _this select 0;
				private _hitdamage = _this select 2;
				private _unitDamage = _unit getVariable ["ENG_BOOTCAMP_currentDamage", 0];
				
				_unitDamage = _unitDamage + _hitDamage;
				_unit setVariable ["ENG_BOOTCAMP_currentDamage", _unitDamage];
				
				if (_unitDamage >= 0.85) then
				{
					_unit setCaptive true;
					_unit playMove "AmovPercMstpSsurWnonDnon";
					_unit disableAI "ANIM";
				};
				
				0
			}];
			
			_x setVariable ["ENG_BOOTCAMP_InTrainingMode", true, false];
		};
	} foreach allUnits;

	sleep 1;
};
