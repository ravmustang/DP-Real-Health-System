/*
	DonkeyPunch Epoch Realism Script Alpha
	DP_Real_Health_Messaging.sqf
	By =RAV=MusTanG
	For DonkeyPunch EpochMod Servers
*/
dpReal_Messaging = {
	params ["_msg"];
	if!(_msg isEqualType "")exitWith{systemChat ("DP Real Health system is not sending messages, please let your admin know!")};
	switch(DPRH_MessagingType)do
	{
		case "systemChat":
		{
			systemchat(_msg);
		};
		case "titleText":
		{
			titleText [_msg, "PLAIN DOWN"];
		};
		case "hint":
		{
			hint _msg;
		};
	};
};