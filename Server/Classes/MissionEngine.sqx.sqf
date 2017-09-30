


















cl_TrainingForrestPatrol_Server_MissionEngine_constructor = { private "_class_fields"; _class_fields = [["TrainingForrestPatrol_Server_MissionEngine", []]]; _class_fields };



cl_TrainingForrestPatrol_Server_MissionEngine_Start = { params ["_class_fields", "_this"];
    waitUntil { count allPlayers > 0 };

    player sideChat "Mission engine has started.";


    private _firstPlayer = (allPlayers select 0);
    _class_fields set [1, getPos _firstPlayer];

    waitUntil { { (_class_fields select 1) distance _x > 50 } count allPlayers == count allPlayers };

    player sideChat "Players are on the move!";

    waitUntil { !isNil "eng_enemyLeader" };

    player sideChat "Got enemy leader!";

    waitUntil { sleep 10; { eng_enemyLeader distance _x < 400 } count allPlayers > 0 };

    player sideChat "Enemies are close!";

    [getPos eng_enemyLeader, "o_inf", "ColorOpfor"] call Sqx_Markers_Marker_CreateIconMarker;
    hint ("Enemy patrol sighted in direction " + str (round ((leader group player) getDir getPos eng_enemyLeader)) + ". Moving in direction " + str (round getDir eng_enemyLeader) + "."); };