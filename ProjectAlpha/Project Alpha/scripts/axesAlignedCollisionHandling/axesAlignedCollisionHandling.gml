// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function axesAlignedCollisionHandling() {
	if(velocityX == 0 and velocityY == 0) return;
	var IDlist = ds_list_create();
	var nums = instance_place_list(x+velocityX, y+velocityY, ObjWall, IDlist, false);
	if(nums == 0){ 
		ds_list_destroy(IDlist);
		return;
	}
	var timesT = [2, 2];
	for(var i = 0; i < nums; i++) {
		var wallID = IDlist[| i];
		var times = [2, 2];
		if(velocityX != 0) {
			var tR = (wallID.bbox_left - bbox_right)/velocityX;
			var tL = (wallID.bbox_right - bbox_left)/velocityX;
			if(tR <= 1.1 and tR >= -0.1) times[0] = tR;
			if(tL <= 1.1 and tL >= -0.1 and tL < times[0]) times[0] = tL;
		}
		if(velocityY != 0) {
			var tB = (wallID.bbox_top - bbox_bottom)/velocityY;
			var tT = (wallID.bbox_bottom - bbox_top)/velocityY;
			if(tB <= 1.1 and tB >= -0.1) times[1] = tB;
			if(tT <= 1.1 and tT >= -0.1 and tT < times[1]) times[1] = tT;
		}
		if(times[0] <= times[1] and times[0] != 2 and timesT[0] > times[0]) timesT[0] = times[0];
		if(times[1] <= times[0] and times[1] != 2 and timesT[1] > times[1]) timesT[1] = times[1];
	}
	if(timesT[0] != 2) {
	x += velocityX*timesT[0];
		velocityX = 0;
	} 
	if(timesT[1] != 2){
		y += velocityY*timesT[1];
		velocityY = 0;
	}
	ds_list_destroy(IDlist);
}