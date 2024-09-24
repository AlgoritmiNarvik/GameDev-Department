function scrPause(){
	//Ensure that the pause handler exist
	if(!instance_exists(ObjPauseHandler)) return;
	var pauseHandler = instance_find(ObjPauseHandler, 0);
	
	//Set pause handler callerID variable to current caller ID
	pauseHandler.callerID = id;
	
	//set pauseTrigger
	pauseHandler.pauseTrigger = true;
}