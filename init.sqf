//Load Settings 
[] execVM "scripts\DPRealHealth\settings.sqf";
call compile preProcessFileLineNumbers "scripts\DPRealHealth\DP_Real_Health.sqf";
call compile preProcessFileLineNumbers "scripts\DPRealHealth\DP_Real_Health_Messaging.sqf";
[] spawn {[] execVM "scripts\DPRealHealth\DP_Real_Health_check.sqf";};