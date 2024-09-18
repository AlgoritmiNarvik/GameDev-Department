// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function axesAlignedCollisionHandling(){
	if(place_meeting(x+velocityX, y, ObjWall)) {
		while(!place_meeting(x+sign(velocityX), y, ObjWall)) {
			x += sign(velocityX);
		}
		velocityX = 0;
	}
	x += velocityX;
	if(place_meeting(x, y+velocityY, ObjWall)) {
		while(!place_meeting(x, y+sign(velocityY), ObjWall)) {
			y += sign(velocityY);
		}
		velocityY = 0;
	}
	y += velocityY;
}