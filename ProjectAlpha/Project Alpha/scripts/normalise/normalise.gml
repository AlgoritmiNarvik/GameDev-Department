// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function normalise() {
	var length = sqrt(velocityX*velocityX + velocityY*velocityY);
	velocityX /= length;
	velocityY /= length;
}