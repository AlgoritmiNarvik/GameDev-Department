/// @description Insert description here
// You can write your code in this editor
var fullHarts = floor(hp/2);
var i = 0
var size = 54;
var sp = 5;
var topCorner = instance_find(ObjCamHandler, 0);
topCorner = topCorner.playerPos[playerNumber];
draw_set_alpha(1);
if(topCorner[0] != 0) show_debug_message(topCorner[0]);
for(; i < fullHarts; i++) {
	draw_sprite_stretched(SprHeart, 0, 10 + i*(size+sp) + topCorner[0], 10 + topCorner[1], size, size);
}
if(hp%2 == 1) {
	draw_sprite_stretched(SprHalfHeart, 0, 10 + i*(size+sp) + topCorner[0], 10 + topCorner[1], size, size);
	i++;
}
for(; i< maxHp/2; i++) {
	draw_sprite_stretched(SprEmptyHeart, 0, 10 + i*(size+sp) + topCorner[0], 10 + topCorner[1], size, size);
}