/// @description Insert description here
// You can write your code in this editor
texturegroup_load("UI")
audio_group_load(Musicgroup);
audio_group_load(SFXgroup)
startMusicLoop = -1;
alarm[0] = 480;
global.UI_WhereAreWe = 0;

#region FMod

global.UsingFMod = false;

var fmod_channels = 1024;
var fmod_flags = FMOD_INIT.NORMAL;

fmod_system = fmod_system_create();
fmod_system_init(fmod_channels, fmod_flags);

#region UI

global.UI_UpSound = fmod_system_create_sound(fmod_path_bundle("audio/UI_UpSound.wav"), FMOD_MODE.LOOP_OFF);
global.UI_DownSound = fmod_system_create_sound(fmod_path_bundle("audio/UI_DownSound."), FMOD_MODE.LOOP_OFF);
global.UI_SelectedSound = fmod_system_create_sound(fmod_path_bundle("audio/UI_SelectedSound"), FMOD_MODE.LOOP_OFF);
global.UI_CantSelectSound = fmod_system_create_sound(fmod_path_bundle("audio/UI_CantSelectSound.wav"), FMOD_MODE.LOOP_OFF);
global.UI_BackSound = fmod_system_create_sound(fmod_path_bundle("audio/UI_BackSound"), FMOD_MODE.LOOP_OFF);
global.UI_DrrrrSound = fmod_system_create_sound(fmod_path_bundle("audio/UI_DrrrrSound"), FMOD_MODE.LOOP_OFF);
global.UI_WindSound = fmod_system_create_sound(fmod_path_bundle("audio/UI_WindSound"), FMOD_MODE.LOOP_NORMAL);
global.UI_SunSound = fmod_system_create_sound(fmod_path_bundle("audio/UI_SunSound"), FMOD_MODE.LOOP_NORMAL);
global.UI_VinylSound = fmod_system_create_sound(fmod_path_bundle("audio/UI_VinylSound"), FMOD_MODE.LOOP_OFF);
global.UI_GearBounceSound = fmod_system_create_sound(fmod_path_bundle("audio/UI_GearBounceSound"), FMOD_MODE.LOOP_OFF);
global.UI_ScrollingStarsSound = fmod_system_create_sound(fmod_path_bundle("audio/UI_ScrollingStarsSound"), FMOD_MODE.LOOP_OFF);

#endregion

#region Sheer

global.Sheer_WalkSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_WalkSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_DashGroundSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_DashAirSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_JumpSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_JumpLandSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_CommandJumpSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_LightWhiffSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_MediumWhiffSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_MediumHitSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_MediumCrouchWhiffSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_MediumCrouchHitSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_MediumAirWhiffSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_MediumAirHitSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_MediumForwardWhiffSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_MediumBackAirWhiffSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_HeavyChargeWhiffSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_HeavyWhiffSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_HeavyHitSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_HeavyAirSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_HeavyForwardChargeSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_HeavyDownAirSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_AirGrabWhiffSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_SpecialProjoChargeSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_SpecialProjoStartSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_SpecialProjoActiveSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_SpecialZaeshChargeSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_SpecialZaeshDashGroundSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_SpecialZaeshDashAirSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_SpecialZaeshHitSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_SpecialShahSetupSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_SpecialShahFloatSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_SpecialShahShootSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);
global.Sheer_BlockSound = fmod_system_create_sound(fmod_path_bundle("audio/Sheer_UpSound"), FMOD_MODE.LOOP_OFF);

#endregion

#region All Characters

global.All_WallBounceSound = fmod_system_create_sound(fmod_path_bundle("audio/All_UpSound"), FMOD_MODE.LOOP_OFF);
global.All_LightHitSound = fmod_system_create_sound(fmod_path_bundle("audio/All_UpSound"), FMOD_MODE.LOOP_OFF);
global.All_BlockSound = fmod_system_create_sound(fmod_path_bundle("audio/All_UpSound"), FMOD_MODE.LOOP_OFF);
global.All_BigImpactSound = fmod_system_create_sound(fmod_path_bundle("audio/All_UpSound"), FMOD_MODE.LOOP_OFF);

#endregion

#region Ambiance

global.Amb_CampSound = fmod_system_create_sound(fmod_path_bundle("audio/Amb_CampSound.wav"), FMOD_MODE.LOOP_NORMAL)

#endregion

#endregion