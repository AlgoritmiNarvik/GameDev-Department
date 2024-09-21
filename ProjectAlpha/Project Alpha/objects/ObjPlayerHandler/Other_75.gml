switch(async_load[? "event_type"]) {
	case "gamepad discovered": {                   
	    var pad = async_load[? "pad_index"];       
	    gamepad_set_axis_deadzone(pad, 0.5);       
	    gamepad_set_button_threshold(pad, 0.1);
		ds_map_add(gamepads, pad, 0);
	    break;
	}
	case "gamepad lost": {
	    var pad = async_load[? "pad_index"];
	    ds_map_delete(gamepads, pad);
		for(var i = 0; i < 4; i++) {
			if(players[i].inputDevice == pad) {
				players[i].controlScheme = "controller";
				instance_deactivate_object(players[i]);
				playerCount--;
				break;
			}
		}
	    break;
	}
}