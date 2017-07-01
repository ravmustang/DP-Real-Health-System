/*
	DonkeyPunch Epoch Realism Script Alpha
	DP_Real_Health_Settings.sqf
	By =RAV=MusTanG
	For DonkeyPunch EpochMod Servers
*/

//Real Health Settings
DPRH_CheckTimeFrame = 60; // default: 60 seconds in between health checks

DPRH_MessagingType = "systemChat"; // alternates: "titleText", "hint"

DPRH_HungerMsg = "YOU ARE HUNGRY! EAT OR YOU WILL DIE SOON";
DPRH_HungerThreshold = 120; //default: 120
DPRH_HungerDrop =  5; // default: 5
DPRH_HungerDamage = 0.005; // default: 0.005

DPRH_ThirstMsg = "YOU ARE THIRSTY! DRINK SOMETHING OR YOU WILL DIE SOON!";
DPRH_ThirstThreshold = 60; //default: 60
DPRH_ThirstDrop = 2; // default: 2
DPRH_ThirstDamage = 0.002; // default: 0.002

DPRH_WetMsg = "YOU ARE SOAKED! DRY UP OR YOU WILL GET SICK";
DPRH_ChangeIfSoaked = [0.2, 0.25]; // changes inside array: [Temp(0.2), Immunity(0.1)]

DPRH_SoiledMsg = "YOU ARE FILTHY! CLEAN UP OR YOU WILL BECOME TOXIC";
DPRH_ToxicChangeIfSoiled = 0.3; // default: 0.3

DPRH_ToxicityMsg = "YOU ARE TOXIC! SEE A MEDIC OR YOU WILL GET SICK";
DPRH_ImmunityChangeIfToxic = 0.3; // default: 0.3

DPRH_ImmunityMsg = "IMMUNE DEFICIENCY! SEE A MEDIC OR YOU WILL DIE";
DPRH_ChangeIfLowImmunity = [0.5, 1, 5]; // changes inside array: [Temp(0.5), Toxicity(1), Stamina(5)]

DPRH_BloodPressMsg = "YOU ARE FUCKED UP! HEAL OR YOU WILL DIE SOON";
DPRH_ChangeIfHighBP = [50, 0.5, 0.002]; // changes inside array: [Stamina(50), Temp(0.5), Damage(0.002)]

DPRH_TempMsg = "YOU ARE OVERHEATING! USE A COLDPACK NOW!";
DPRH_ChangeIfOverHeated = [0.001, 0.002]; // changes inside array: [BloodPressure(0.001), Damage(0.002)]

//DP Real Health Defaults - DO NOT CHANGE 
DPRH_CurrentLoopTime = 60;