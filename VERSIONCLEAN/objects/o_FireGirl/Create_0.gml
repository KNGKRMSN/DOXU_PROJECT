_newX = 0;
_newY = 0;

maxHealth = 1000;
currentHealth = maxHealth;

maxSpecial = 8;
currentSpecial = maxSpecial;
///Mouvement
movespeed = 20;
runspeed = 20;		// a Test 
Maxrunspeed = 50;
horizontalspeed = 0;
verticalspeed = 0;
grv = 6;   // Graviter
airfric = 1;
isJumpingL = 0;
IsJumpingN = 0;
isJumpingR = 0;
isCrouching = 0;
isGlissade = 0;
canjumpcancel = 0;
Run = false;
Jumplen = 26;
JumpHi = -110;
Dashdist = 110;

runR = 0;
runL = 0;
BackrunR = 0;
BackrunL = 0;

/*hasdashedinair = 0;
hascommandjumped = 0;*/

dash = false;
dash_spd = 100;
dash_dir = 0;
dash_cooldown = 0;
can_dash = 0;

isStartingJump = 0;

///Combat
hit = 0;
/*hitDirectionModifier = 100;
mediumHitDirectionModifier = 160;*/

isgettingcomboed = 0;
isAttacking = 0;

isgettingcomboedpreviouswindguys = isgettingcomboed;

isAutoComboing = false;

_canshootprojo = 0;
isinstartingframes = false;

zaeshStartX = 0;
zaeshStartY = 0;

// atk temp
Atkframe = 0;
Atktemp = 0;
Atkreco = 0;


///ASSISTS
isinswitch = false;

///VariousCheck
lastimput = 0;
isdoinglecouprelou = 0;
isdoingledeuxiemecouprelou = 0;
secondtolastimput = 0;
speedbonus = 1;
toutvabien = 1;

isinblock = false;
isinhit = false;
isknockeddown = false;
knockeddowntime = 30;
knockeddowncurrenttime = 0;
bouncedagainstwall = false;
bouncedagainstground = false;
typeOfHit = 0;
gettingHit = false;
hitBy = -1;
hitStun = 0;
blockStun = 0;
haschargedenough = 0;
hasstartedshake = 0;
shakestartx = 0;

landed = 0;
facing = 0;

done = 0;
done1 = 0;

hasplacedamark = 0;

windboost = 1;

left = 0;
right = 0;
jump = 0;
down = 0;
lightattack = 0;
mediumattack = 0;
heavyattack = 0;
specialattack = 0;
special2 = 0;

lefths = 0;
righths = 0;
jumphs = 0;
downhs = 0;
lightattackhs = 0;
mediumattackhs = 0;
heavyattackhs = 0;
specialattackhs = 0;

jumpduringhitstop = 0;

hasjumpcanceled = 0;

pushbackwhileattacking = false;

isblocking = 0;
neutralguard = 0;
done = 0;
facing = 0;

shakex = 0;
shakemoinsx = 0;
downheavied = 0;
horizontalspeeddownheavyhit = 0;
backmediumed = 0;
verticalspeedbackmedium = 0;

///Shader

horrifi_enable(true);

horrifi_bloom_set(true,26.56,0.30,0.72);
horrifi_chromaticab_set(false,0.64);
horrifi_scanlines_set(false,0.10);
horrifi_vhs_set(false,0.10);
horrifi_vignette_set(true,0.30,0.87);
horrifi_crt_set(false,2);
horrifi_noise_set(true,0.17);


roundsWon = 0;

OUDREHEHA = false;
if (keyboard_check(ord("K")))
	OUDREHEHA = true;
player = 0;
j = -1;

//hurtbox
hurtbox = HurtBox_create(300,600,-150,-600);

//hitbox
hitbox = -1;

if player = 1
	image_blend = c_red;
	
collisionmask = mask_index;






