/// @description Insert description here
// You can write your code in this editor

if(!controllerSelect) return;
if(keyboard_check_pressed(ord("W")) and keyboard_check(ord("A")) and keyboard_check(ord("D"))) {
	for(var i = 0; i < 4; i++) {
		if(!WASD and players[i].controlScheme == "") {
			players[i].controlScheme = "WASD";
			WASD = true;
			playerCount++;
			return;
		} else if(players[i].controlScheme == "WASD") {
			players[i].controlScheme = "";
			WASD = false;
			playerCount--;
			return;
		}
	}
}

if(keyboard_check_pressed(vk_up) and keyboard_check(vk_right) and keyboard_check(vk_left)) {
	for(var i = 0; i < 4; i++) {
		if(!arrowKeys and players[i].controlScheme == "") {
			players[i].controlScheme = "arrowKeys";
			arrowKeys = true;
			playerCount++;
			return;
		} else if(players[i].controlScheme == "arrowKeys") {
			players[i].controlScheme = "";
			arrowKeys = false;
			playerCount--;
			return;
		}
	}
}
for(var i = ds_map_find_first(gamepads); i != undefined; i = ds_map_find_next(gamepads, i)) {
	if(gamepad_button_check_pressed(i, gp_face1) and gamepad_button_check(i, gp_shoulderl) and gamepad_button_check(i, gp_shoulderr)) {
		for(var j = 0; j < 4; j++) {
			if(players[j].controlScheme = "" and ds_map_find_value(gamepads, i) == 0) {
				players[j].controlScheme = "controller";
				players[j].inputDevice = i;
				ds_map_replace(gamepads, i, 1);
				playerCount++;
				return;
			} else if(players[j].inputDevice == i) {
				players[j].controlScheme = "";
				players[j].inputDevice = -1;
				ds_map_replace(gamepads, i, 0);
				playerCount--;
				return;
			}
		}
	}
}