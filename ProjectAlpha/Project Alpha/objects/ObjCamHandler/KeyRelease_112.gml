/// @description Insert description here
// You can write your code in this editor
if(playerHandlerID.controllerSelect) return;
for(var i = 0; i < 4; i++) {
	view_visible[i] = false;
}

if(playerHandlerID.playerCount == 0) {
	camera_set_view_pos(view_camera[0], 0, 0);
	camera_set_view_size(view_camera[0], camWidth, camHeight);
	camera_set_view_target(view_camera[0], noone);
	view_set_wport(0, window_get_width());
	view_set_hport(0, window_get_height());
	view_visible[0] = true;
	return;
}
playerPos = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]];
playerDimension = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]];
var pos = 0;
if(playerHandlerID.playerCount == 3) {
	surface_set_target(application_surface);
	draw_clear_alpha(c_black, 1);
	surface_reset_target();
}
for(var i = 0; i < 4; i++) if(playerHandlerID.players[i].controlScheme != "") {
	var playerID = playerHandlerID.players[i];
	var xx = playerID.x;			
	var yy = playerID.y;
	switch(playerHandlerID.playerCount) {
		case(1): {
			camera_set_view_pos(view_camera[i], xx - camWidth/2, yy - camHeight/2);
			
			camera_set_view_size(view_camera[i], camWidth, camHeight);
			camera_set_view_border(view_camera[i], xBorder, yBorder);
			
			camera_set_view_target(view_camera[i], playerID);
			
			playerPos[i] = [0, 0]; 
			
			playerDimension[i] = [window_get_width(), window_get_height()]
			
			view_visible[i] = true;
			break;
		}
		case(2): {
			camera_set_view_pos(view_camera[i], xx - camWidth/4, yy - camHeight/2);
			
			camera_set_view_size(view_camera[i], camWidth/2, camHeight);
			camera_set_view_border(view_camera[i], xBorder/2, yBorder);
			
			camera_set_view_target(view_camera[i], playerID);
			
			playerPos[i] = [pos*window_get_width()/2, 0];
			
			playerDimension[i] = [window_get_width()/2, window_get_height()]

			view_visible[i] = true;
			pos++;
			break;
		}
		default: {
			camera_set_view_pos(view_camera[i], xx - camWidth/2, yy - camHeight/2);
			
			camera_set_view_size(view_camera[i], camWidth, camHeight);
			camera_set_view_border(view_camera[i], xBorder, yBorder);
			
			camera_set_view_target(view_camera[i], playerID);
			
			playerPos[i] = [(i%2)*window_get_width()/2, floor(i/2)*window_get_height()/2];
			
			playerDimension[i] = [window_get_width()/2, window_get_height()/2]
			
			view_visible[i] = true;
			break;
		}
	}
	view_set_xport(i, playerPos[i][0]);
	view_set_yport(i, playerPos[i][1]);
	
	view_set_wport(i, playerDimension[i][0]);			
	view_set_hport(i, playerDimension[i][1]);
}
