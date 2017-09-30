call compile preprocessFileLineNumbers "Server\Classes\MissionEngine.sqx.sqf";



private ["_missionEngine"];

_missionEngine = (call cl_TrainingForrestPatrol_Server_MissionEngine_constructor);

sleep 2;

([_missionEngine, []] call cl_TrainingForrestPatrol_Server_MissionEngine_Start);