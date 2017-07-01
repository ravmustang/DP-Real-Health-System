/*
	DonkeyPunch Epoch Realism Script Alpha
	DP_Real_Health_Checks.sqf
	By =RAV=MusTanG
	For DonkeyPunch EpochMod Servers
*/ 
while {true} do 
{ 
	if((alive player) && (typeOF player != "VirtualMan_EPOCH") && (diag_tickTime > DPRH_CurrentLoopTime))then
	{
		_time = diag_tickTime;
		_wet = EPOCH_playerWet;
		_hunger = EPOCH_playerHunger;
		_thirst = EPOCH_playerThirst;
		_soiled = EPOCH_playerSoiled;
		_tox = EPOCH_playerToxicity;
		_bloodP = EPOCH_playerBloodP;
		_immune = EPOCH_playerImmunity;
		
		if(_hunger < DPRH_HungerThreshold)then{call dpReal_Health;}else{EPOCH_playerHunger+EPOCH_playerHunger-DPRH_HungerDrop;};
		if(_thirst < DPRH_ThirstThreshold)then{call dpReal_Health;}else{EPOCH_playerThirst=EPOCH_playerThirst-DPRH_ThirstDrop;};
		if(_wet >= 95)then{call dpReal_Health;};
		if(_soiled > 20)then{call dpReal_Health;};
		if(_tox > 50)then{call dpReal_Health;};
		if(_bloodP > 100)then{call dpReal_Health;};
		if(_immune < -50)then{call dpReal_Health;};
		DPRH_CurrentLoopTime = _time + DPRH_CheckTimeFrame;
	};
};