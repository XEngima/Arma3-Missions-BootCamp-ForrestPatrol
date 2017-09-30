if (isServer) then {
    call compile preprocessFileLineNumbers "Server\InitServer.sqx.sqf"; };


if (!isDedicated) then {
    waitUntil { player == player };
    call compile preprocessFileLineNumbers "Client\InitClient.sqx.sqf"; };