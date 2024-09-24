/// @description Camera look ahead

//No point having character look ahead in a menu
if(menu) return;

//Loop through every camera
for(var i = 0; i < 4; i++) if(view_visible[i]) {
	//Get relevant player information
	var playerID = playerHandlerID.players[i];
	
	var xx = playerID.x;			
	var yy = playerID.y;
	
	//Player will probably attack in direction of point of interest
	var dirX = playerID.attackDirX;
	var dirY = playerID.attackDirY;
	
	//Interpolat movement
	camPosInRoom[i][0] = lerp(camPosInRoom[i][0], xx + dirX*50 - camDimensionInRoom[i][0]/2, 0.15);
	camPosInRoom[i][1] = lerp(camPosInRoom[i][1], yy + dirY*50 - camDimensionInRoom[i][1]/2, 0.15);
	
	//Make sure camera doesn't go out of bounds
	if(camPosInRoom[i][0] < 0) camPosInRoom[i][0] = 0;
	
	if(camPosInRoom[i][1] < 0) camPosInRoom[i][1] = 0;
	
	if(camPosInRoom[i][0] > room_width - camDimensionInRoom[i][0]) 
		camPosInRoom[i][0] = room_width - camDimensionInRoom[i][0];
	
	if(camPosInRoom[i][1] > room_height - camDimensionInRoom[i][1])
		camPosInRoom[i][1] = room_height - camDimensionInRoom[i][1];

	//Set camera position in room
	camera_set_view_pos(view_camera[i], camPosInRoom[i][0], camPosInRoom[i][1]);
}
