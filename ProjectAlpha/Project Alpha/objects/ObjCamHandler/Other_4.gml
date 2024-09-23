/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < 4; i++) {
	view_camera[i] = camera_create_view(0, 0, windowWidth, windowHeight);
	view_enabled[i] = true;
}
camera_set_view_pos(view_camera[0], 0, 0);
view_visible[0] = true;
alarm[0] = 1;