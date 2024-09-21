switch(async_load[? "event_type"]) {
	case "gamepad discovered": {                   
	    var pad = async_load[? "pad_index"];       
	    gamepad_set_axis_deadzone(pad, 0.5);       
	    gamepad_set_button_threshold(pad, 0.1);
		for(var i = 0; i < array_length(gamepads); i++) {
			if(gamepads[i] == -1) {
				gamepads[i] = pad;
				break;
			}
			if(i == array_length(gamepads)-1) gamepads[array_length(gamepads)] = pad;
		}
	    break;
	}
	case "gamepad lost": {
	    var pad = async_load[? "pad_index"];
	    for(var i = 0; i < array_length(gamepads); i++) {
			if(gamepads[i] == pad) {
				gamepads[i] = -1;
				break;
			}
		}
		for(var i = 0; i < 4; i++) {
			if(players[i].inputDevice == pad) {
				players[i].controlScheme = "controller";
				instance_deactivate_object(players[i]);
				playerCount--;
				playersControls[i] = "";
				break;
			}
		}
	    break;
	}
}