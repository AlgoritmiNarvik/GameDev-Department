/// @description Draw controller select screen

// Return if players are not selecting controllers
if(!controllerSelect) return;

// Draw black overlay
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(0, 0, camHandler.windowWidth, camHandler.windowHeight, false);
draw_set_alpha(1);

// Update animation frame
animationFrame += 7/fps;
animationFrame %= 1000;

// Define some useful variables
var offsetX = -128;
var offsetY = -400; 
var size = 256;

// Draw control scheme sprites
draw_sprite_stretched(sprArrowKeysControls, animationFrame, camHandler.windowWidth/2 - 300 + offsetX, camHandler.windowHeight/2 + offsetY, size, size);
draw_sprite_stretched(sprWASDControls, animationFrame, camHandler.windowWidth/2 + offsetX, camHandler.windowHeight/2 + offsetY, size, size);
draw_sprite_stretched(sprControllerControls, animationFrame, camHandler.windowWidth/2  + 300 + offsetX, camHandler.windowHeight/2 + offsetY, size, size);

// Draw four boxes for the individual possible players and draw sprite on top of control scheme is selected
draw_set_color(make_color_rgb(240, 240, 240));
for(var i = 0; i < 4; i++) {
	draw_rectangle(camHandler.windowWidth/2 + 250*i - 500 + 25, camHandler.windowHeight/2 - 150, camHandler.windowWidth/2 + 250*i - 300 + 25, camHandler.windowHeight/2 + 200, false);
	if(controlSchemeList[i] != "") draw_sprite(sprTemp, 0, camHandler.windowWidth/2 + 250*i - 500 + 25 + 100 - 16, camHandler.windowHeight/2);
}

