player addEventHandler ["HandleDamage", {
	private _player = _this select 0;
	private _damage = _this select 2;
	
	ENGIMA_BOOTCAMP_playerDamage = ENG_BOOTCAMP_playerDamage + _damage;

	[_player] spawn {
		params ["_player"];
	
		if (ENGIMA_BOOTCAMP_playerDamage >= 1) then
		{
			_player setCaptive true;
			titleText ["Dead!", "PLAIN"];
			_player playMove "AmovPercMstpSsurWnonDnon";
			waitUntil { player animationPhase "AmovPercMstpSsurWnonDnon" >= 1 };
			_player enableSimulationGlobal false;
		};
	};
	
	0
}];
