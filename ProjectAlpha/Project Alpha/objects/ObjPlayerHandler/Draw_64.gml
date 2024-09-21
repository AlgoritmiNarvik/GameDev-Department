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
draw_sprite_stretched(sprArrowKeysControls, animationFrame, view_wport[0]/2 - 300 + offsetX, view_hport[0]/2 + offsetY, size, size);
draw_sprite_stretched(sprWASDControls, animationFrame, view_wport[0]/2+ offsetX, view_hport[0]/2 + offsetY, size, size);
draw_sprite_stretched(sprControllerControls, animationFrame, view_wport[0]/2  + 300 + offsetX, view_hport[0]/2 + offsetY, size, size);

draw_set_color(make_color_rgb(240, 240, 240));
for(var i = 0; i < 4; i++) {
	draw_rectangle(view_wport[0]/2 + 250*i - 500 + 25, view_hport[0]/2 - 150, view_wport[0]/2 + 250*i - 300 + 25, view_hport[0]/2 + 200, false);
	if(players[i].controlScheme != "") draw_sprite(sprTemp, 0, view_wport[0]/2 + 250*i - 500 + 25 + 100 - 16, view_hport[0]/2);
}
