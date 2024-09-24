

if(!controllerSelect) return;
var controlScheme = "";
var inputDevice = -1;
var nothingAddRemove = 0;

if(keyboard_check_pressed(ord("W")) and keyboard_check(ord("A")) and keyboard_check(ord("D"))) {
	controlScheme = "WASD";
	nothingAddRemove += 1 + WASD;
}

if(keyboard_check_pressed(vk_up) and keyboard_check(vk_right) and keyboard_check(vk_left)) {
	controlScheme = "arrowKeys";
	nothingAddRemove += 1 + arrowKeys;
}

for(var i = ds_map_find_first(gamepads); i != undefined; i = ds_map_find_next(gamepads, i))
	if(gamepad_button_check_pressed(i, gp_face1) and gamepad_button_check(i, gp_shoulderl) and gamepad_button_check(i, gp_shoulderr)) {
	controlScheme = "controller";
	inputDevice = i;
	nothingAddRemove += 1 + ds_map_find_value(gamepads, i);
}

if(!nothingAddRemove) return;

for(var i = 0; i < 4; i++) {
	if(nothingAddRemove == 1 and controlSchemeList[i] == "") {
		controlSchemeList[i] = controlScheme;
		players[i].controlScheme = controlScheme;
		players[i].inputDevice = inputDevice;
		playerInputDeviceList[i] = inputDevice;
		switch(controlScheme) {
		case("WASD"):
			WASD = true;
			break;
		case("arrowKeys"):
			arrowKeys = true;
			break;
		case("controller"):
			ds_map_replace(gamepads, inputDevice, 1);
			break;
		}
		playerCount++;
		return;
	} 
	if(nothingAddRemove == 2 and controlSchemeList[i] == controlScheme) {
		controlSchemeList[i] = "";
		players[i].controlScheme = "";
		players[i].inputDevice = -1;
		playerInputDeviceList[i] = -1;
		switch(controlScheme) {
		case("WASD"):
			WASD = false;
			break;
		case("arrowKeys"):
			arrowKeys = false;
			break;
		case("controller"):
			ds_map_replace(gamepads, inputDevice, 0);
			break;
		}
		playerCount--;
		return;
	}
}