ENG_BOOTCAMP_playerDamage = 0;

call compile preprocessFileLineNumbers "Engima\BootCamp\TrainingAmmo\Client\EventHandlers\HandleDamage.sqf";

execVM "Engima\BootCamp\TrainingAmmo\Server\UnitsSpawnService.sqf";
