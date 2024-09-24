//Initiation of the map of all connected controllers
gamepads = ds_map_create();

//Initiation list of player objects
players = [noone, noone, noone, noone];

//Initiation list of player control scheme
controlSchemeList = ["","","",""];

//Initiation list of player input devices
playerInputDeviceList = [-1, -1, -1, -1]

camHandler = instance_find(ObjCamHandler, 0);
