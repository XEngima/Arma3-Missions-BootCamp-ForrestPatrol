/******************************************************************************************/
/*
 * See the file Engima\PatrolledAreas\Documentation.txt for a full documentation regarding 
 * start parameters.
 *
/******************************************************************************************/

private ["_parameters"];

private _playerCount = count units group ((call BIS_fnc_listPlayers) select 0);

// Set custom parameters here
_parameters = [
	["PATROL_AREAS", ["eng_patrolAreaMarker"]],
	["HIDE_MARKERS", false],
	["UNIT_CLASSES", ["O_G_Soldier_F", "O_G_Soldier_lite_F"]],
	["SIDE", east],
	["MIN_UNITS_PER_GROUP", _playerCount],
	["MAX_UNITS_PER_GROUP", _playerCount],
	["SPAWN_DISTANCE", 8000],
	["AREA_PER_GROUP", 1000000],
	["GROUP_PROBABILITY_OF_PRESENCE", 1],
	["MIN_SKILL", 0.1],
	["MAX_SKILL", 0.2],
	["ON_GROUP_CREATED", {
		params ["_group"];
		
		eng_enemyLeader = leader _group;
		
		[_group] spawn {
			params ["_group"];
			private _unitsCount = count units _group;
			
			waitUntil { { _x getVariable ["ENG_BOOTCAMP_isNeutralized", false] } count units group eng_enemyLeader >= _unitsCount};
			ENG_missionSuccess = true;
			publicVariable "ENG_missionSuccess";
		};
	}],
	["DEBUG", false]
];

/******************************************************************************************/
/*  Function Call - Do not edit below this line (unless you know what you are doing)      */
/******************************************************************************************/

// Start script
_parameters call PATAREAS_PatrolledAreas;
