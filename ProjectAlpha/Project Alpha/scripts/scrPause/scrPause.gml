// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrPause(){
	if(!instance_exists(ObjPauseHandler)) return;
	var pauseHandler = instance_find(ObjPauseHandler, 0);
	pauseHandler.callerID = id;
	pauseHandler.pauseTrigger = true;
}