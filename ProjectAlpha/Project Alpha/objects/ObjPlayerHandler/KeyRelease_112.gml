/// @description Insert description here
// You can write your code in this editor
if(controllerSelect) return;
for(var i = 0; i < 4; i++) if(players[i].controlScheme == ""){
	instance_deactivate_object(players[i]);
} else {
	instance_activate_object(players[i]);
}