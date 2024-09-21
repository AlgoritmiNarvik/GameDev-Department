/// @description Insert description here
// You can write your code in this editor
if(playerCount == 0) controllerSelect = true;
if(!controllerSelect) return;
if(keyboard_check_pressed(ord("W")) and keyboard_check(ord("A")) and keyboard_check(ord("D"))) {
	for(var i = 0; i < 4; i++) {
		if(!WASD and players[i].controlScheme == "") {
			instance_activate_object(players[i]);
			players[i].controlScheme = "WASD";
			WASD = true;
			playerCount++;
			return;
		} else if(players[i].controlScheme == "WASD") {
			players[i].controlScheme = "";
			instance_deactivate_object(players[i]);
			WASD = false;
			playerCount--;
			return;
		}
	}
}

if(keyboard_check_pressed(vk_up) and keyboard_check(vk_right) and keyboard_check(vk_left)) {
	for(var i = 0; i < 4; i++) {
		if(!arrowKeys and players[i].controlScheme == "") {
			instance_activate_object(players[i]);
			players[i].controlScheme = "arrowKeys";
			arrowKeys = true;
			playerCount++;
			return;
		} else if(players[i].controlScheme == "arrowKeys") {
			players[i].controlScheme = "";
			instance_deactivate_object(players[i]);
			arrowKeys = false;
			playerCount--;
			return;
		}
	}
}
for(var i = 0; i < array_length(gamepads); i++) {
	var device = gamepads[i];
	if(gamepad_button_check_pressed(device, gp_face1) and gamepad_button_check(device, gp_shoulderl) and gamepad_button_check(device, gp_shoulderr)) {
		for(var j = 0; j < 4; j++) {
			if(device == -1 and players[j].controlScheme = "") {
				instance_activate_object(players[i]);
				players[j].controlScheme = "arrowKeys";
				players[j].inputDevice = device;
				playerCount++;
				return;
			} else if(players[j].controlScheme = "arrowKeys") {
				players[j].controlScheme = "";
				players[j].inputDevice = -1;
				instance_deactivate_object(players[i]);
				playerCount--;
				return;
			}
		}
	}
}