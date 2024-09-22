/// @description Insert description here
// You can write your code in this editor
buttonPromptY = -40;
function onButtonPress(objID) constructor {
	draw_text(camHandler.playerPos[objID.playerNumber][0] + camHandler.playerDimension[objID.playerNumber][0]/2,
	camHandler.playerPos[objID.playerNumber][1] + camHandler.playerDimension[objID.playerNumber][1] - 20, "Hei dette er en test meling")
	

	if(alarm[0] < 0) alarm[0] = fps*2;
}