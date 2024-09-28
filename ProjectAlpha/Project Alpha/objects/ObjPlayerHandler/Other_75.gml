//Add async switch statement
switch(async_load[? "event_type"]) {
	//Check if async event is a controller getting connected
	case "gamepad discovered": {
		// Get controller input device
	    var pad = async_load[? "pad_index"];
	    gamepad_set_axis_deadzone(pad, 0.1);
	    gamepad_set_button_threshold(pad, 0.1);
		// Put controller input device in list of input devices and set it to not in use
		ds_map_add(gamepads, pad, 0);
	    break;
	}
	
	//Check if async event is a controller getting disconnected
	case "gamepad lost": {
		// Get controller input device
	    var pad = async_load[? "pad_index"];
		
		// Check if controller is in use
	    if(ds_map_find_value(gamepads, pad)) {
			//Loop through the four character slots
			for(var i = 0; i < 4; i++) {
				// Check for the players that the controller is controlling
				if(players[i].inputDevice == pad) {
					//Update players and player handler
					controlSchemeList[i] = "";
					players[i].controlScheme = "";
					players[i].inputDevice = -1;
					playerInputDeviceList[i] = -1;
					
					//Deactivate player object
					instance_deactivate_object(players[i]);
					
					//Decrease player count
					playerCount--;
					
					// Remove controller input device from list of input devices
					ds_map_delete(gamepads, pad);
					
					//Redetermine camera in use
					with(camHandler) {
						event_user(0);
					}
					return;
				}
			}
		}
		
		// Remove controller input device from list of input devices
		ds_map_delete(gamepads, pad);
	}
}