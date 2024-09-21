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
for(var i = ds_map_find_first(gamepads); i != undefined; i = ds_map_find_next(gamepads, i)) {
	if(gamepad_button_check_pressed(i, gp_face1) and gamepad_button_check(i, gp_shoulderl) and gamepad_button_check(i, gp_shoulderr)) {
		for(var j = 0; j < 4; j++) {
			if(players[j].controlScheme = "" and ds_map_find_value(gamepads, i) == 0) {
				instance_activate_object(players[j]);
				players[j].controlScheme = "controller";
				players[j].inputDevice = i;
				ds_map_replace(gamepads, i, 1);
				playerCount++;
				return;
			} else if(players[j].inputDevice == i) {
				players[j].controlScheme = "";
				players[j].inputDevice = -1;
				ds_map_replace(gamepads, i, 0);
				instance_deactivate_object(players[j]);
				playerCount--;
				return;
			}
		}
	}
}