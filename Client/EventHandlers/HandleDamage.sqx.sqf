player addEventHandler ["HandleDamage", {
    private _player = _this select 0;
    private _damage = _this select 2;

    [_player, _damage] spawn {
        params ["_player", "_damage"];

        if (_damage + (getDammage _player) >= 0.75) then {

            _player setCaptive true;
            titleText ["Dead!", "PLAIN"];
            _player playMove "AmovPercMstpSsurWnonDnon";
            waitUntil { player animationPhase "AmovPercMstpSsurWnonDnon" >= 1 };
            _player enableSimulationGlobal false; }; };



    0 }];