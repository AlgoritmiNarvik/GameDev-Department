/// @description Update active and inactive players

// Return of selecting controls
if(controllerSelect) return;

// Update active and inactive players
for(var i = 0; i < 4; i++) if(controlSchemeList[i] == ""){
	instance_deactivate_object(players[i]);
} else {
	instance_activate_object(players[i]);
}

// Redetermine camera in use
with(camHandler) {
	event_user(0);
}