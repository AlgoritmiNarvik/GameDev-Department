/// @description Insert description here
// You can write your code in this editor
gamepads = ds_map_create();
players = [];
players[0] = instance_create_layer(room_width/2, room_height/2, "entities", objPlayer);
players[0].controlScheme = "WASD";
for(var i = 1; i < 4; i++) {
	players[i] = instance_create_layer(room_width/2, room_height/2, "entities", objPlayer);
	instance_deactivate_object(players[i]);
}