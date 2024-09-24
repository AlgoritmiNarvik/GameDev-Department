/// @description Insert description here


// Allow borderless windows
window_enable_borderless_fullscreen(true);

// Get ID of player handler
playerHandlerID = instance_find(ObjPlayerHandler, 0);

//Camera position in window. If -1 position not set
camPosInWindow = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]];

//Camera dimension in window. If -1 position not set
camDimensionInWindow = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]];

//Camera position in room. If -1 position not set
camPosInRoom = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]];

//Camera position in room. If -1 position not set
camDimensionInRoom = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]];

//Set window start size
window_set_size(windowWidth, windowHeight);


