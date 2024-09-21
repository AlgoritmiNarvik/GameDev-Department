/// @description Insert description here
// You can write your code in this editor
draw_self();
var playerID = instance_place(x,y,objPlayer)
if(isPressed) {
	onButtonPress();
} else if(playerID != noone and !isPressed) {
	draw_set_alpha(1);
	animationFrame += 7/fps;
	animationFrame %= 1000;
	var px = (bbox_right+bbox_left)/2 + buttonPromptX;
	var py = (bbox_top+bbox_bottom)/2 + buttonPromptY;
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	switch(playerID.controlScheme) {
		case("WASD"): {
			draw_sprite(SprEButtonKeyboard, animationFrame, px, py);
			if(keyboard_check_pressed(ord("E"))) {
				isPressed = true;
			}
			break;
		}
		case("arrowKeys"): {
			draw_sprite(SprVButtonKeyboard, animationFrame, px, py);
			if(keyboard_check_pressed(ord("V"))) {
				isPressed = true;
			}
			break;
		}
		case("controller"): {
			draw_sprite(SprXButtonControl, animationFrame, px, py);
			if(gamepad_button_check_pressed(playerID.inputDevice, gp_face3)) {
				isPressed = true;
			}
			break;
		}
	}
}