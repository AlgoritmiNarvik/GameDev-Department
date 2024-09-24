/// @description Create camera

//Initialise camera memory
for(var i = 0; i < 4; i++) {
	view_camera[i] = camera_create_view(0, 0, windowWidth, windowHeight);
	view_enabled[i] = true;
}

//Wait one frame for player handler
alarm[0] = 1;