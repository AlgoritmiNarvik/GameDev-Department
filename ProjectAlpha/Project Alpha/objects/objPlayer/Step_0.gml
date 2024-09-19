switch(controlScheme) {
	case("WASD"): {
		velocityX = keyboard_check_direct(ord("D")) - keyboard_check_direct(ord("A"));
		velocityY = keyboard_check_direct(ord("S")) - keyboard_check_direct(ord("W"));
		normalise();
		break;
	}
	case("arrowKeys"): {
		velocityX = keyboard_check_direct(vk_right) - keyboard_check_direct(vk_left);
		velocityY = keyboard_check_direct(vk_down) - keyboard_check_direct(vk_up);
		attack = keyboard_check_pressed(ord("C"));
		normalise();
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
if(alarm[0] < 0 and attack) {
	attacking = true;
	alarm[0] = attackSpeed*fps;
	instance_activate_object(hitBoxID);
	alarm[1] = attackDuration*fps;
}
if(is_nan(velocityX)) velocityX  = 0;
if(is_nan(velocityY)) velocityY  = 0;
if((velocityX != 0 or velocityY != 0) and !attacking) {
		attackDirX = velocityX;
		attackDirY = velocityY;
}
velocityX *= moveSpeed*delta_time/100000*(attackSlowDown*attacking + !attacking);
velocityY *= moveSpeed*delta_time/100000*(attackSlowDown*attacking + !attacking);
axesAlignedCollisionHandling();

x += velocityX;
y += velocityY;

if(attacking) {
	hitBoxID.x = x+attackDirX*16;
	hitBoxID.y = y+attackDirY*16;
}