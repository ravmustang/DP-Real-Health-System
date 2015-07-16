if (!isDedicated and hasInterface) then 
{
	waitUntil {alive vehicle player};	
	waitUntil {typeOF player != "VirtualMan_EPOCH"};

		[] execVM "scripts\DPRealHealth\DP_Real_Health_check.sqf";
};