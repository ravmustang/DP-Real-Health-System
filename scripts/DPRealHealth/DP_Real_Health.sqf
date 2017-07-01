/*
	DonkeyPunch Epoch Realism Script Alpha
	DP_Real_Health.sqf
	By =RAV=MusTanG
	For DonkeyPunch EpochMod Servers
*/
dpReal_Health = {
	_hunger = EPOCH_playerHunger;
	_thirst = EPOCH_playerThirst;
	_wet = EPOCH_playerWet;
	_soiled = EPOCH_playerSoiled;
	_immune = EPOCH_playerImmunity;
	_tox = EPOCH_playerToxicity;
	_bloodP = EPOCH_playerBloodP;
	_ptemp = EPOCH_playerTemp;
	_stamina = EPOCH_playerStamina;
	_pdamage = damage player;
	
	if(_hunger < 100) then
	{
		_damage = _pdamage + DPRH_HungerDamage;
		[DPRH_HungerMsg] call dpReal_Messaging;
		player setDamage _damage;
		sleep 15;
		_ate = EPOCH_playerHunger;
		if(_ate < 100) then {call dpReal_Health;};
	};

	if(_thirst < 50) then
	{
		_damage = _pdamage + DPRH_ThirstDamage;
		[DPRH_ThirstMsg] call dpReal_Messaging;
		player setDamage _damage;
		sleep 15;
		_drank = EPOCH_playerThirst;
		if(_drank < 50) then {call dpReal_Health;};
	};

	if(_wet > 90) then
	{
		EPOCH_playerTemp = EPOCH_playerTemp + (DPRH_ChangeIfSoaked select 0);
		EPOCH_playerImmunity = EPOCH_playerImmunity - (DPRH_ChangeIfSoaked select 1);
		[DPRH_WetMsg] call dpReal_Messaging;
		sleep 15;		
		if(_wet > 90) then {call dpReal_Health;};
	};

	if(_soiled > 20) then 
	{
		EPOCH_playerToxicity = EPOCH_playerToxicity + DPRH_ToxicChangeIfSoiled;
		[DPRH_SoiledMsg] call dpReal_Messaging;
		sleep 15;
		if(_soiled > 23) then {call dpReal_Health;};
	};

	if(_tox > 50) then 
	{
		EPOCH_playerImmunity = EPOCH_playerImmunity - DPRH_ImmunityChangeIfToxic;
		[DPRH_ToxicityMsg] call dpReal_Messaging;
		sleep 15;
		if(_tox > 50) then {call dpReal_Health;};
	};

	if(_immune < -50)then
	{
		EPOCH_playerTemp = EPOCH_playerTemp + (DPRH_ChangeIfLowImmunity select 0);
		Epoch_playerToxicity = Epoch_playerToxicity + (DPRH_ChangeIfLowImmunity select 1);
		EPOCH_playerStamina = EPOCH_playerStamina - (DPRH_ChangeIfLowImmunity select 2);
		[DPRH_ImmunityMsg] call dpReal_Messaging;
		sleep 15;
		if(_immune < -50)then{call dpReal_Health;};
	};

	if(_bloodP > 110) then 
	{
		[DPRH_BloodPressMsg] call dpReal_Messaging;
		EPOCH_playerStamina = EPOCH_playerStamina - (DPRH_ChangeIfHighBP select 0);
		EPOCH_playerTemp = EPOCH_playerTemp + (DPRH_ChangeIfHighBP select 1);
		_damage = _pdamage + (DPRH_ChangeIfHighBP select 2);
		player setDamage _damage;
		sleep 15;
		if(_bloodP > 110) then {call dpReal_Health;};
	};

	if(_ptemp > 99.5) then 
	{
		[DPRH_TempMsg] call dpReal_Messaging;
		EPOCH_playerBloodP = EPOCH_playerBloodP + (DPRH_ChangeIfOverHeated select 0);
		_damage = _pdamage + (DPRH_ChangeIfOverHeated select 1);
		player setDamage _damage;
		sleep 15;
		if(_ptemp > 99.5) then {call dpReal_Health;};
	};	
};
