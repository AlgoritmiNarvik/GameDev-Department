/// @description Initiate players objects

// Check it entities layer exist
if(!layer_exists("entities")) return;

// Variable to store player object type
var playerObj;
switch(room) {
	default: {
		// Determine the room specific player object type
		playerObj = objPlayer;
		
		// Set whether the room is a menu or not
		camHandler.menu = false;
	}
}

//Loop through each player slot
for(var i = 0; i < 4; i++) {
	//Look for preset player coordinates
	if(global.PlayerSpawnPoint[0] == -1 or global.PlayerSpawnPoint[1] == -1) {
		// Create player object instant at the middle of the room
		players[i] = instance_create_layer(room_width/2, room_height/2, "entities", playerObj);
	} else {
		// Create player object instant at the preset player coordinates
		players[i] = instance_create_layer(global.PlayerSpawnPoint[0], global.PlayerSpawnPoint[1], "entities", playerObj);
	}
	// Set player number
	players[i].playerNumber = i;
	
	// Check if player has a controls game
	if(controlSchemeList[i] == "") {
		// Deactivate player object instant
		instance_deactivate_object(players[i]);
	} else {
		// Set player control scheme and input device
		players[i].controlScheme = controlSchemeList[i];
		players[i].inputDevice = playerInputDeviceList[i];
	}
}