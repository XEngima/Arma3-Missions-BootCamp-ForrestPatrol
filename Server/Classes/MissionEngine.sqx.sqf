


















cl_BootCampForrestPatrol_Server_MissionEngine_constructor = { private "_class_fields"; _class_fields = [["BootCampForrestPatrol_Server_MissionEngine", []]]; _class_fields };



cl_BootCampForrestPatrol_Server_MissionEngine_Start = { params ["_class_fields", "_this"];
    waitUntil { count allPlayers > 0 };


    private _firstPlayer = (allPlayers select 0);
    _class_fields set [1, getPos _firstPlayer];

    waitUntil { { (_class_fields select 1) distance _x > 75 } count allPlayers > 0 };

    ["Mission has started. Enemy patrol is on the move!"] call dre_fnc_CL_ShowTitleTextAllClients;

    waitUntil { !isNil "eng_enemyLeader" };

    waitUntil { sleep (random 60); { eng_enemyLeader distance _x < 400 } count allPlayers > 0 };

    [getPos eng_enemyLeader, "o_inf", "ColorOpfor"] call Sqx_Markers_Marker_CreateIconMarker;
    ["Enemy patrol sighted in direction " + str (round ((leader group player) getDir getPos eng_enemyLeader)) + ". Moving in direction " + str (round getDir eng_enemyLeader) + "."] call dre_fnc_CL_ShowTitleTextAllClients; };