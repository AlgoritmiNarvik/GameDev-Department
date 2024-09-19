// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function axesAlignedCollisionHandling() {
	if(velocityX == 0 and velocityY == 0) return;
	//Create a ds list for to have the instence ID in
	var IDlist = ds_list_create();
	//Fill the ID list and return the lenght of the list
	var nums = instance_place_list(x+velocityX, y+velocityY, ObjWall, IDlist, false);
	//check if the are no collisions if so then return
	if(nums == 0){ 
		//clean up ID list
		ds_list_destroy(IDlist);
		return;
	}
	//list of sub farme times, only one for each axes
	var timesT = [2, 2];
	//loop through ID list
	for(var i = 0; i < nums; i++) {
		//get element in ID list and put it in wallID
		var wallID = IDlist[| i];
		//time of collision
		//there wil only be one collision per object
		var time = 2;
		if(velocityX != 0) {
			//divide the distance between this and wall on this velocity to get time
			var tR = (wallID.bbox_left - bbox_right)/velocityX;
			var tL = (wallID.bbox_right - bbox_left)/velocityX;
			//check if time is between 0 and 1 frame
			if(tR <= 1 and tR >= -0.1) time = tR;
			if(tL <= 1 and tL >= -0.1) time = tL;
			//check if this collision is first collision in time in x axes
			if(time < timesT[0]) timesT[0] = time;
			//only one collision per object. if a collision has happend you dont need to testing this object
			if(time != 2) continue;
		}
		//same as above but for y
		if(velocityY != 0) {
			var tB = (wallID.bbox_top - bbox_bottom)/velocityY;
			var tT = (wallID.bbox_bottom - bbox_top)/velocityY;
			if(tB <= 1 and tB >= -0.1) time = tB;
			if(tT <= 1 and tT >= -0.1) time = tT;
			if(time < timesT[1]) timesT[1] = time;
		}
	}
	//check if tre has been a collision the x axes 
	if(timesT[0] != 2) {
		//adjust x position
		x += velocityX*timesT[0];
		velocityX = 0;
	} 
	//check if tre has been a collision the y axes 
	if(timesT[1] != 2){
		//adjust y position
		y += velocityY*timesT[1];
		velocityY = 0;
	}
	//clean up ID list
	ds_list_destroy(IDlist);
}