/// @description Insert description here
// You can write your code in this editor
draw_self();
var playerID = instance_place(x,y,objPlayer)
if(isPressed) {
	onButtonPress();
} else if(playerID != noone and !isPressed) {
	var px = (bbox_right+bbox_left)/2 + buttonPromptX;
	var py = (bbox_top+bbox_bottom)/2 + buttonPromptY;
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	switch(playerID.controlScheme) {
		case("WASD"): {
			draw_text(px, py, "E");
			if(keyboard_check_pressed(ord("E"))) {
				isPressed = true;
			}
			break;
		}
		case("arrowKeys"): {
			draw_text(px, py, "V");
			if(keyboard_check_pressed(ord("V"))) {
				isPressed = true;
			}
			break;
		}
		case("controller"): {
			draw_text(px, py, "X");
			if(gamepad_button_check_pressed(playerID.inputDevice, gp_face3)) {
				isPressed = true;
			}
			break;
		}
	}
}