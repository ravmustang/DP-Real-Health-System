/*
	DonkeyPunch Real Health Stats v0.3
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
	_DamageBody = player getHitPointDamage "HitBody";  // if > 0.5
	_DamageHead = player getHitPointDamage "HitHead"; // if > 0.5
	_pdamage = damage player;
	
	if(_hunger < 100) then
	{
		_damage = _pdamage + 0.005;
		systemchat("YOU ARE HUNGRY! EAT OR YOU WILL DIE SOON");
		player setDamage _damage;
		sleep 10;
		_ate = EPOCH_playerHunger;
		if(_ate < 100) then {call dpReal_Health;};
	};
	
	if(_thirst < 50) then
	{
		_damage = _pdamage + 0.002;
		systemchat("YOU ARE THIRSTY! DRINK SOMETHING OR YOU WILL DIE SOON!");
		player setDamage _damage;
		sleep 10;
		_drank = EPOCH_playerThirst;
		if(_drank < 50) then {call dpReal_Health;};
	};
	
	if(_wet > 80) then
	{
		_temp = EPOCH_playerTemp - 0.2;
		systemchat("YOU ARE SOAKED! DRY UP OR YOU WILL GET SICK");
		EPOCH_playerTemp = _temp;
		sleep 10;		
		if(_wet > 80) then {call dpReal_Health;};
	};
	
	if(_soiled > 20) then 
	{
		_toxic = EPOCH_playerToxicity - 0.3;
		systemchat("YOU ARE FILTHY! CLEAN UP OR YOU WILL BECOME TOXIC");
		EPOCH_playerToxicity = _toxic;
		sleep 10;
		if(_soiled > 23) then {call dpReal_Health;};
	};
	
	if(_tox > 50) then 
	{
		_immunity = EPOCH_playerImmunity - 0.3;
		systemchat("YOU ARE TOXIC! SEE A MEDIC OR YOU WILL GET SICK");
		EPOCH_playerImmunity = _immunity;
		sleep 10;
		if(_tox > 50) then {call dpReal_Health;};
	};
	
	if(_immune < -50)then
	{
		EPOCH_playerTemp = EPOCH_playerTemp + 0.5;
		Epoch_playerToxicity=Epoch_playerToxicity+1;
		EPOCH_playerStamina=EPOCH_playerStamina-5;
		systemchat("IMMUNE DEFICIENCY! SEE A MEDIC OR YOU WILL DIE");
		sleep 10;
		if(_immune < -50)then{call dpReal_Health;};
	};
	
	if(_bloodP > 110) then 
	{
		systemchat("YOU ARE FUCKED UP! HEAL OR YOU WILL DIE SOON");
		EPOCH_playerStamina = EPOCH_playerStamina -50;
		EPOCH_playerTemp = EPOCH_playerTemp + 0.5;
		_damage = _pdamage + 0.002;
		player setDamage _damage;
		sleep 10;
		if(_bloodP > 110) then {call dpReal_Health;};
	};
	
	if(_DamageHead > 0.5) then {call dpReal_Health;};
	{
		EPOCH_playerTemp = EPOCH_playerTemp + 0.5;
		Epoch_playerImmunity =Epoch_playerImmunity-0.5;
		Epoch_playerToxicity=Epoch_playerToxicity+1;
		EPOCH_playerStamina=0;
		_damage = _pdamage + 0.002;
		player setDamage _damage;
		systemchat("YOU HAVE A HEAD WOUND! HEAL OR YOU WILL DIE SOON");
		sleep 10;
		if(_DamageHead > 0.5) then {call dpReal_Health;};
	};
	
	
	
	
};
