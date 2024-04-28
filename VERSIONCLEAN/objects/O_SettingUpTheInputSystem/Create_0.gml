/// @description Insérez la description ici
global.SetUpInput = 0;
if (global.SetUpInput == 0)
{
	input_combo_create("hadoukenR", 20)
	.hold("down")
	.press("right")
	.release("down")
	.press_or_release("special");

	input_combo_create("hadoukenL", 20)
	.hold("down")
	.press("left")
	.release("down")
	.press_or_release("special");
	
	input_combo_create("reversehadoukenR", 20)
	.press("left")
	.ignore(["down", "up"])
	.release("left")
	.press("right")
	.press_or_release("special");
	
	input_combo_create("reversehadoukenL", 20)
	.press("right")
	.ignore(["down", "up"])
	.release("right")
	.press("left")
	.press_or_release("special");
	
	input_combo_create("dragonpunchR")
	.press_or_release("right")
	.hold("down")
	.press("right")
	.press_or_release("special");
	
	input_combo_create("dragonpunchL")
	.hold("left")
	.release("left")
	.hold("down")
	.press("left")
	.press_or_release("special");

	input_combo_create("chargeR")
	.charge("left")
	.ignore(["down", "medium", "heavy", "light", "dash"])
	.press("right")
	.press_or_release("special");

	input_combo_create("chargeRU")
	.charge("left")
	.ignore(["down", "medium", "heavy", "light", "dash"])
	.press("up")
	.press_or_release("special");

	input_combo_create("chargeL")
	.charge("right")
	.ignore(["down", "medium", "heavy", "light", "dash"])
	.press("left")
	.press_or_release("special");

	input_combo_create("chargeLU")
	.charge("right")
	.ignore(["down", "medium", "heavy", "light", "dash"])
	.press("up")
	.press_or_release("special");

	input_combo_create("dashd")
	.press("down")
	.release("down")
	.press("down");

	input_combo_create("dashu")
	.press("up")
	.release("up")
	.press("up");

	input_combo_create("dashl")
	.press("left")
	.release("left")
	.press("left");

	input_combo_create("dashr")
	.press("right")
	.release("right")
	.press("right");
	
	input_combo_create("superjump")
	.ignore(["left", "right"])
	.press("down")
	.press("up");
	
	global.SetUpInput = 1;
}