// Return if players are not selecting controllers
if(!controllerSelect) return;

// Variable to keep track of what kind of control scheme we are working with
var controlScheme = "";

// Input device in case of controller
var inputDevice = -1;

// Variable to keep track of whether to do nothing, add control Scheme or remove control Scheme
var nothingAddRemove = 0;

// Check for the WASD input key
if(keyboard_check_pressed(ord("W")) and keyboard_check(ord("A")) and keyboard_check(ord("D")) and controlScheme == "") {
	// Set control scheme
	controlScheme = "WASD";
	// Add one to show that a control scheme has been chosen
	// and add WASD to determine whether to add control scheme or remove dcontrol scheme
	nothingAddRemove += 1 + WASD;
}

// Check for the arrow keys input key
if(keyboard_check_pressed(vk_up) and keyboard_check(vk_right) and keyboard_check(vk_left) and controlScheme == "") {
	// Set control scheme
	controlScheme = "arrowKeys";
	// Add one to show that a control scheme has been chosen
	// and add arrowKeys to determine whether to add control scheme or remove control scheme
	nothingAddRemove += 1 + arrowKeys;
}

//Loop through all controllers
for(var i = ds_map_find_first(gamepads); i != undefined; i = ds_map_find_next(gamepads, i)) {
	if(controlScheme != "") break;
	// Check for the controller input key
	if(gamepad_button_check_pressed(i, gp_face1) and gamepad_button_check(i, gp_shoulderl) and gamepad_button_check(i, gp_shoulderr)) {
		// Set control scheme
		controlScheme = "controller";
		// Set input device
		inputDevice = i;
		// Add one to show that a control scheme has been chosen
		// and add input device use indicator to determine whether to add control scheme or remove control scheme
		nothingAddRemove += 1 + ds_map_find_value(gamepads, i);
	}
}
// Check if no control scheme has been added or removed if so return
if(!nothingAddRemove) return;

//Loop through the four character slots
for(var i = 0; i < 4; i++) {
	// Check if we're adding control scheme and that current control scheme is not set
	if(nothingAddRemove == 1 and controlSchemeList[i] == "") {
		
		//Update players and player handler
		controlSchemeList[i] = controlScheme;
		players[i].controlScheme = controlScheme;
		players[i].inputDevice = inputDevice;
		playerInputDeviceList[i] = inputDevice;
		
		//Update indicator to determine whether any individual control scheme/input device is in use
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
		
		//Increase player count
		playerCount++;
		return;
	} 
	
	// Check if we're removing control scheme and that current control scheme is set and that input device matches
	if(nothingAddRemove == 2 and controlSchemeList[i] == controlScheme and playerInputDeviceList[i] == inputDevice) {
		
		//Update players and player handler
		controlSchemeList[i] = "";
		players[i].controlScheme = "";
		players[i].inputDevice = -1;
		playerInputDeviceList[i] = -1;
		
		//Update indicator to determine whether any individual control scheme/input device is in use
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
		
		//Decrease player count
		playerCount--;
		return;
	}
}