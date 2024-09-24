/// @description Insert description here
// You can write your code in this editor
buttonPromptY = -40;
function onButtonPress(objID) constructor {
	draw_text(camHandler.camPosInWindow[objID.playerNumber][0] + camHandler.camDimensionInWindow[objID.playerNumber][0]/2,
	camHandler.camPosInWindow[objID.playerNumber][1] + camHandler.camDimensionInWindow[objID.playerNumber][1] - 20, "Hei dette er en test meling")
	

	if(alarm[0] < 0) alarm[0] = fps*2;
}