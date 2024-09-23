/// @description Insert description here
// You can write your code in this editor

if(!controllerSelect) return;
if(keyboard_check_pressed(ord("W")) and keyboard_check(ord("A")) and keyboard_check(ord("D"))) {
	for(var i = 0; i < 4; i++) {
		if(!WASD and controlSchemeList[i] == "") {
			players[i].controlScheme = "WASD";
			controlSchemeList[i] = "WASD";
			WASD = true;
			playerCount++;
			return;
		} else if(players[i].controlScheme == "WASD") {
			players[i].controlScheme = "";
			controlSchemeList[i] = "";
			WASD = false;
			playerCount--;
			return;
		}
	}
}

if(keyboard_check_pressed(vk_up) and keyboard_check(vk_right) and keyboard_check(vk_left)) {
	for(var i = 0; i < 4; i++) {
		if(!arrowKeys and controlSchemeList[i] == "") {
			players[i].controlScheme = "arrowKeys";
			controlSchemeList[i] = "arrowKeys"
			arrowKeys = true;
			playerCount++;
			return;
		} else if(players[i].controlScheme == "arrowKeys") {
			players[i].controlScheme = "";
			controlSchemeList[i] = ""
			arrowKeys = false;
			playerCount--;
			return;
		}
	}
}
for(var i = ds_map_find_first(gamepads); i != undefined; i = ds_map_find_next(gamepads, i)) {
	if(gamepad_button_check_pressed(i, gp_face1) and gamepad_button_check(i, gp_shoulderl) and gamepad_button_check(i, gp_shoulderr)) {
		for(var j = 0; j < 4; j++) {
			if(controlSchemeList[j] = "" and ds_map_find_value(gamepads, i) == 0) {
				players[j].controlScheme = "controller";
				controlSchemeList[j] = "controller";
				players[j].inputDevice = i;
				ds_map_replace(gamepads, i, 1);
				playerCount++;
				return;
			} else if(players[j].inputDevice == i) {
				players[j].controlScheme = "";
				controlSchemeList[j] = "";
				players[j].inputDevice = -1;
				ds_map_replace(gamepads, i, 0);
				playerCount--;
				return;
			}
		}
	}
}