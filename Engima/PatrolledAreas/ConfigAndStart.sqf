/******************************************************************************************/
/*
 * See the file Engima\PatrolledAreas\Documentation.txt for a full documentation regarding 
 * start parameters.
 *
/******************************************************************************************/

private ["_parameters"];

// Set custom parameters here
_parameters = [
	["PATROL_AREAS", ["eng_patrolAreaMarker"]],
	["HIDE_MARKERS", false],
	["UNIT_CLASSES", ["O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_SL_F", "O_G_Soldier_TL_F", "O_G_Soldier_AR_F", "O_G_medic_F", "O_G_engineer_F", "O_G_Soldier_exp_F", "O_G_Soldier_GL_F", "O_G_Soldier_M_F", "O_G_Soldier_LAT_F", "O_G_Soldier_A_F", "O_G_officer_F"]],
	["SIDE", east],
	["MIN_UNITS_PER_GROUP", 2],
	["MAX_UNITS_PER_GROUP", 2],
	["SPAWN_DISTANCE", 8000],
	["AREA_PER_GROUP", 1000000],
	["GROUP_PROBABILITY_OF_PRESENCE", 1],
	["MIN_SKILL", 0.1],
	["MAX_SKILL", 0.2],
	["ON_GROUP_CREATED", {
		eng_enemyLeader = leader (_this select 0);
		
		{
			_x disableAI "WEAPONAIM";
			_x addEventHandler ["HandleDamage", {
				scopeName "main";
				private _unit = _this select 0;
				private _hitdamage = _this select 2;
				
				private _totalDamage = _hitDamage + (getDammage _unit);
				
				if (_totalDamage >= 0.75) then
				{
					_unit setCaptive true;
					_unit playMove "AmovPercMstpSsurWnonDnon";
					_unit disableAI "ANIM";
				};
				
				0
			}];
		} foreach units (_this select 0);
	}],
	["DEBUG", false]
];

/******************************************************************************************/
/*  Function Call - Do not edit below this line (unless you know what you are doing)      */
/******************************************************************************************/

// Start script
_parameters call PATAREAS_PatrolledAreas;
