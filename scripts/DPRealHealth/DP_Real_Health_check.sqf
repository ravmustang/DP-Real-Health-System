/*
	DonkeyPunch Real Health Stats v0.3
	DP_Real_Health_check.sqf
	By =RAV=MusTanG
	For DonkeyPunch EpochMod Servers
*/ 
while {true} do { 
	
	_rainlevel = rain;
	_wet = EPOCH_playerWet;
	_hunger = EPOCH_playerHunger;
	_thirst = EPOCH_playerThirst;
	_soiled = EPOCH_playerSoiled;
	_tox = EPOCH_playerToxicity;
	_bloodP = EPOCH_playerBloodP;
	_immune = EPOCH_playerImmunity;
	
	if(_hunger < 120)then{call dpReal_Health;}else{EPOCH_playerHunger+EPOCH_playerHunger-5;};
	if(_thirst < 60)then{call dpReal_Health;}else{EPOCH_playerThirst=EPOCH_playerThirst-2;};
	if(_rainlevel > 0.1)then{EPOCH_playerWet=EPOCH_playerWet+0.1;};
	if(_wet > 100)then{call dpReal_Health;};
	if(_soiled > 20)then{call dpReal_Health;};
	if(_tox > 50)then{call dpReal_Health;};
	if(_bloodP > 100)then{call dpReal_Health;};
	if(_immune < -50)then{call dpReal_Health;};
	
	sleep 30;
};





	