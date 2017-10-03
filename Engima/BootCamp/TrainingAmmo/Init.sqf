if (isServer) then {
	call compile preprocessFileLineNumbers "Engima\BootCamp\TrainingAmmo\Server\InitServer.sqf";
};

if (!isDedicated) then {
	call compile preprocessFileLineNumbers "Engima\BootCamp\TrainingAmmo\Client\InitClient.sqf";
};
