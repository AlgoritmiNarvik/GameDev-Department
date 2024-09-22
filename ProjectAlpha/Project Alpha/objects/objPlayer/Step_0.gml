switch(controlScheme) {
	case("WASD"): {
		velocityX = keyboard_check_direct(ord("D")) - keyboard_check_direct(ord("A"));
		velocityY = keyboard_check_direct(ord("S")) - keyboard_check_direct(ord("W"));
		if(alarm[2] < 0) attack = keyboard_check_pressed(vk_space);
		var temp = normalise(velocityX, velocityY);
		velocityX = temp[0];
		velocityY = temp[1];
		break;
	}
	case("arrowKeys"): {
		velocityX = keyboard_check_direct(vk_right) - keyboard_check_direct(vk_left);
		velocityY = keyboard_check_direct(vk_down) - keyboard_check_direct(vk_up);
		if(alarm[2] < 0) attack = keyboard_check_pressed(ord("C"));
		var temp = normalise(velocityX, velocityY);
		velocityX = temp[0];
		velocityY = temp[1];
		break;
	}
	case("controller"): {
		velocityX = gamepad_axis_value(inputDevice, gp_axislh);
		velocityY = gamepad_axis_value(inputDevice, gp_axislv);
		if(alarm[2] < 0) attack = gamepad_button_check_pressed(inputDevice, gp_face1);
		break;
	}
}

if(attack and alarm[2] < 0) alarm[2] = (attackSpeed - attackDuration + 0.1)*fps;

if(alarm[0] < 0 and attack) {
	attacking = true;
	alarm[0] = attackSpeed*fps;
	instance_activate_object(hitBoxID);
	alarm[1] = attackDuration*fps;
}

if(is_nan(velocityX)) velocityX  = 0;
if(is_nan(velocityY)) velocityY  = 0;

if((velocityX != 0 or velocityY != 0) and !attacking) {
	var temp = normalise(velocityX, velocityY);
	attackDirX = temp[0];
	attackDirY = temp[1];
}

velocityX *= moveSpeed*delta_time/100000*(attackSlowDown*attacking + !attacking);
velocityY *= moveSpeed*delta_time/100000*(attackSlowDown*attacking + !attacking);

move_and_collide(velocityX, velocityY, [ObjWall, ObjHole]);

if(attacking) {
	hitBoxID.x = x + attackDirX*32;
	hitBoxID.y = y + attackDirY*32;
}