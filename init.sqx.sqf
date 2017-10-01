if (isServer) then {
    execVM "Server\InitServer.sqx.sqf"; };


if (!isDedicated) then {
    execVM "Client\InitClient.sqx.sqf"; };