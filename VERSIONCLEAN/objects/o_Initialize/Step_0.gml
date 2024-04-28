/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
if (global.HitStop == 1 && done == 0)
{
	alarm[0] = room_speed / 8;
	o_Camera.shakevalue = 1;
	done = 1;
}

if (global.MediumAssHitStop == 1 && done == 0)

{
	alarm[1] = room_speed / 4;
	o_Camera.shakevalue = 3;
	done = 1;
}

if (global.BigAssHitStop == 1 && done == 0)
{
	alarm[1] = room_speed / 2;
	o_Camera.shakevalue = 3;
	done = 1;
}

if (o_Sheer.isgettingcomboed == 0)
{
	global.WindGuyLightAttackStandDamage = 25 * global.DamageReduction;
	global.WindGuyLightAttackCrouchDamage = 25* global.DamageReduction;
	global.WindGuyLightAttackAirDamage = 25* global.DamageReduction;
	global.WindGuyMediumAttackStandDamage = 50* global.DamageReduction;
	global.WindGuyMediumAttackCrouchDamage = 100* global.DamageReduction;
	global.WindGuyMediumAttackAirDamage = 50* global.DamageReduction;
	global.WindGuyMediumAttackBackAirDamage = 100* global.DamageReduction;
	global.WindGuyHeavyAttackStandDamage = 100* global.DamageReduction;
	global.WindGuyHeavyAttackCrouchDamage = 100* global.DamageReduction;
	global.WindGuyHeavyAttackOverHeadDamage = 100* global.DamageReduction;
	global.WindGuyHeavyAttackAirDamage = 100* global.DamageReduction;
	global.WindGuyHeavyAttackBackAirDamage = 100* global.DamageReduction;
	global.WindGuyProjoDamage = 20* global.DamageReduction;
	global.WindGuyZaeshDamage = 150* global.DamageReduction;
	global.WindGuyTornadoDamage = 100* global.DamageReduction;
}







