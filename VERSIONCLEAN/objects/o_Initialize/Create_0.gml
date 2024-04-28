/// @description Variable all
//COMBO
global.DamageReduction = 1;
//Dégats d'attaque 

global.WindGuyLightAttackStandDamage = 25;
global.WindGuyLightAttackCrouchDamage = 25;
global.WindGuyLightAttackAirDamage = 25;
global.WindGuyMediumAttackStandDamage = 50;
global.WindGuyMediumAttackCrouchDamage = 100;
global.WindGuyMediumAttackAirDamage = 50;
global.WindGuyMediumAttackBackAirDamage = 100;
global.WindGuyHeavyAttackStandDamage = 100;
global.WindGuyHeavyAttackCrouchDamage = 100;
global.WindGuyHeavyAttackOverHeadDamage = 100;
global.WindGuyHeavyAttackAirDamage = 100;
global.WindGuyHeavyAttackBackAirDamage = 100;
global.WindGuyProjoDamage = 20;
global.WindGuyZaeshDamage = 150;
global.WindGuyTornadoDamage = 100;

global.LightAttackPushBack = 10;
global.MediumAttackPushBack = 15;
global.MediumAttackCrouchPushBackX = 15;
global.MediumAttackCrouchPushBackY = 90;
global.HeavyAttackPushBack = 18;
global.LightAttackPushBackBlock = 10;
global.MediumAttackPushBackBlock = 15;
global.HeavyAttackPushBackBlock = 18;

global.CounterBonus = 1;


// barre D'hp

global.HealthJ1 = 1000;
global.CurrentHealthJ1 = global.HealthJ1;
global.HealthJ2 = 1000;
global.CurrentHealthJ2 = global.HealthJ2;

global.healthbarw = 800;
global.healthbarh = 26;
global.healthbarJ1x =300;
global.healthbarJy = 150;
global.barborderx = 2;

global.healthbarJ1xborder = 4;
global.healthbarJ1yborder = 5;

global.healthbarJ2x = display_get_width();

global.healthbarJ2xborder = 750;
global.healthbarJ2yborder = 5;


// barre de Special

global.SpecialJ1 = 8;
global.CurrentSpecialJ1 = global.SpecialJ1;
global.SpecialJ2 = 8;
global.CurrentSpecialJ2 = global.SpecialJ2;

global.Specialbarw = 700;
global.Specialbarh = 25;

global.SpecialbarJ1x = 300;
global.SpecialbarJy = 250;

global.SpecialbarJ2x = 793;

// barre d'ulti

global.UltiJ1 = 3000;
global.CurrentUltiJ1 = global.UltiJ1;
global.UltiJ2 = 3000;
global.CurrentUltiJ2 = global.UltiJ2;

global.Ultibarw = 371;
global.Ultibarh = 45;

global.UltibarJ1x = 145;
global.UltibarJ2x = 814;
global.Ultibary = 624;

global.UltibarJ1xborder = 57;
global.UltibarJ2xborder = 1050;
global.UltibarJ1yborder = 500;
global.UltibarJ2yborder = 500;

// image perso ingame

global.CharingameJ1x = 85;
global.CharingameJ1y = 76;

global.CharingameJ2x = 1190;
global.CharingameJ2y = 76;

//
global.MaxDistance = 2790;
global.CurrentDistance = 0;
//Hit Fram stop

global.HitStop = 0;
global.BigAssHitStop = 0;
global.MediumAssHitStop = 0;
global.HitStopTimer = 1;

done = 0;

anim_count = 2;
anims = ds_grid_create(anim_count, 4 );

// Anim 1
anims[# 0,0] = 1; // Current anim Frame
anims[# 0,1] = current_time; // Last time for last frame
anims[# 0,2] = 1000 / 30; // Delay in millisecond before next frame ( 30fps )
anims[# 0,3] = 54;
// Anim 2
anims[# 1,0] = 1; // Current anim Frame
anims[# 2,1] = current_time; // Last time for last frame
anims[# 3,2] = 1000 / 30; // Delay in millisecond before next frame ( 30fps )
anims[# 4,3] = 54; // Total frame number


i = 0;

if (audio_is_playing(MusicMagellan))
	audio_stop_sound(MusicMagellan);

display_set_gui_size(2560, 1440)
global.CantPlayYet = 0;

