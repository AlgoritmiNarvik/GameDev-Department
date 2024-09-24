/// @description Destroy cameras

//Clean up camera memory
for(var i = 0; i < 4; i++) {
	camera_destroy(view_camera[i]);
}
