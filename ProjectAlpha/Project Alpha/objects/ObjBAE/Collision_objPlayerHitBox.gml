/// @description Insert description here
// You can write your code in this editor
if(alarm[1] < 0) {
	alarm[1] = fps/4;
	hp -= 1;
	if(hp <= 0) instance_destroy();
	alarm[0] = 2*fps/5;
	velocityX = other.dirX*5;
	velocityY = other.dirY*5;
}