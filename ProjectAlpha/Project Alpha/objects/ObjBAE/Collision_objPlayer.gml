/// @description Insert description here
// You can write your code in this editor
if(alarm[2] < 0) {
	alarm[2] = fps;
	alarm[0] = fps/3;
	velocityX = 0;
	velocityY = 0;
}
if(other.alarm[3] < 0) {
	other.alarm[3] = other.invincibilityFrames;
	other.hp -= 1;
}