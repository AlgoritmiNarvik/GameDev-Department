switch(controlScheme) {
	case("WASD"): {
		velocityX = keyboard_check_direct(ord("D")) - keyboard_check_direct(ord("A"));
		velocityY = keyboard_check_direct(ord("S")) - keyboard_check_direct(ord("W"));
		normalise()
		break;
	}
	case("arrowKeys"): {
		velocityX = keyboard_check_direct(vk_right) - keyboard_check_direct(vk_left);
		velocityY = keyboard_check_direct(vk_down) - keyboard_check_direct(vk_up);
		normalise()
		break;
	}
	case("controller"): {
		velocityX = gamepad_axis_value(inputDevice, gp_axislh);
		velocityY = gamepad_axis_value(inputDevice, gp_axislv);
		velocityX *= abs(velocityX);
		velocityY *= abs(velocityY);
		break;
	}
}
if(is_nan(velocityX) or is_nan(velocityY)) return;
velocityX *= moveSpeed*delta_time/100000;
velocityY *= moveSpeed*delta_time/100000;
axesAlignedCollisionHandling();
