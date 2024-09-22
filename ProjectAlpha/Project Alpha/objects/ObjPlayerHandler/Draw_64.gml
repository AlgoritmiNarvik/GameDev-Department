/// @description Insert description here
// You can write your code in this editor
if(!controllerSelect) return;
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(0, 0, window_get_width(), window_get_height(), false);

draw_set_alpha(1);
animationFrame += 7/fps;
animationFrame %= 1000;
var offsetX = -128;
var offsetY = -400; 
var size = 256;

draw_sprite_stretched(sprArrowKeysControls, animationFrame, window_get_width()/2 - 300 + offsetX, window_get_height()/2 + offsetY, size, size);
draw_sprite_stretched(sprWASDControls, animationFrame, window_get_width()/2+ offsetX, window_get_height()/2 + offsetY, size, size);
draw_sprite_stretched(sprControllerControls, animationFrame, window_get_width()/2  + 300 + offsetX, window_get_height()/2 + offsetY, size, size);

draw_set_color(make_color_rgb(240, 240, 240));
for(var i = 0; i < 4; i++) {
	draw_rectangle(window_get_width()/2 + 250*i - 500 + 25, window_get_height()/2 - 150, window_get_width()/2 + 250*i - 300 + 25, window_get_height()/2 + 200, false);
	if(players[i].controlScheme != "") draw_sprite(sprTemp, 0, window_get_width()/2 + 250*i - 500 + 25 + 100 - 16, window_get_height()/2);
}
