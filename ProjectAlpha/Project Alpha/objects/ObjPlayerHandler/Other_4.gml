/// @description Insert description here
// You can write your code in this editor
if(!layer_exists("entities")) return;

var playerObj;
switch(room) {
	default: {
		playerObj = objPlayer;
		camHandler.menu = false;
	}
}


for(var i = 0; i < 4; i++) {
	if(global.PlayerSpawnPoint[0] == -1 or global.PlayerSpawnPoint[1] == -1) {
		players[i] = instance_create_layer(room_width/2, room_height/2, "entities", playerObj);
	} else {
		players[i] = instance_create_layer(global.PlayerSpawnPoint[0], global.PlayerSpawnPoint[1], "entities", playerObj);
	}
	players[i].playerNumber = i;
	 if(controlSchemeList[i] == ""){
		instance_deactivate_object(players[i]);
	} else {
		players[i].controlScheme = controlSchemeList[i];
		players[i].inputDevice = playerInputDeviceList[i];
	}
}