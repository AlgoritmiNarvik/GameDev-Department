/// @description Insert description here
// You can write your code in this editor
if(!layer_exists("entities")) return;
for(var i = 0; i < 4; i++) {
	players[i] = instance_create_layer(room_width/2, room_height/2, "entities", objPlayer);
	players[i].playerNumber = i;
	instance_deactivate_object(players[i]);
}