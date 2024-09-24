/// @description Determine camera in use


////////		Reset cameras		//////

//Make all view ports invisible
for(var i = 0; i < 4; i++) {
	view_visible[i] = false;
}

camPosInWindow = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]];

camDimensionInWindow = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]];

camPosInRoom = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]];

camDimensionInRoom = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]];

////////	Reset cameras end	//////


//Make camera one a player independent camera if needed
if(menu) {
	camera_set_view_pos(view_camera[0], 0, 0);
	camera_set_view_size(view_camera[0], room_width, room_height);
	camera_set_view_target(view_camera[0], noone);
	view_set_wport(0, windowWidth);
	view_set_hport(0, windowHeight);
	view_visible[0] = true;
	return;
}

//Make sure that application surface exist
if(surface_exists(application_surface)) {
	//Clear Window surface
	surface_set_target(application_surface);
	draw_clear_alpha(c_black, 1);
	surface_reset_target();
}

var pos = 0;
//Loop through every camera 
for(var i = 0; i < 4; i++) if(playerHandlerID.controlSchemeList[i] != "") {
	//Get relevant player information
	var playerID = playerHandlerID.players[i];
	var xx = playerID.x;			
	var yy = playerID.y;
	
	//Determine camera layout and size based on number of players
	switch(playerHandlerID.playerCount) {
		case(1): {
			camPosInWindow[i] = [0, 0]; 
			
			camDimensionInWindow[i] = [windowWidth, windowHeight];
			
			camPosInRoom[i] = [xx - camWidth/2, yy - camHeight/2];

			camDimensionInRoom[i] = [camWidth, camHeight];
			
			break;
		}
		case(2): {
			camPosInWindow[i] = [pos*windowWidth/2, 0];
			
			camDimensionInWindow[i] = [windowWidth/2, windowHeight]
			
			camPosInRoom[i] = [xx - camWidth/4*1.5, yy - camHeight/2*1.5];

			camDimensionInRoom[i] = [camWidth/2*1.5, camHeight*1.5];
			
			//Keep track if it's the first or second camera
			pos++;
			break;
		}
		default: {
			
			camPosInWindow[i] = [(i%2)*windowWidth/2, floor(i/2)*windowHeight/2];
			
			camDimension[i] = [windowWidth/2, windowHeight/2]
			
			camPosInRoomInWindow[i] = [xx - camWidth/2, yy - camHeight/2];

			camDimensionInRoom[i] = [camWidth, camHeight];
			
			break;
		}
	}
	
	//Set viewport position in Window
	view_set_xport(i, camPosInWindow[i][0]);
	view_set_yport(i, camPosInWindow[i][1]);
	
	//Set viewport dimension in Window
	view_set_wport(i, camDimensionInWindow[i][0]);			
	view_set_hport(i, camDimensionInWindow[i][1]);
	
	//Set view position in romm
	camera_set_view_pos(view_camera[i], camPosInRoom[i][0], camPosInRoom[i][1]);
	
	//Set view dimension in romm
	camera_set_view_size(view_camera[i], camDimensionInRoom[i][0], camDimensionInRoom[i][1]);
	
	//Make camera visible
	view_visible[i] = true;
}