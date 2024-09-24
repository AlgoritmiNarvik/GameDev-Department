/// @description Handle pause

//Turn off blending
gpu_set_blendenable(false);

//Check if game is paused
if(pause) {
	//Set surface to draw to, to currently showing surface
	surface_set_target(application_surface);
	
	//Check if surface we are drawing from (pauseSurface) exists
	if(surface_exists(pauseSurface)) {
		//draw pauseSurface on to application_surface
		draw_surface(pauseSurface, 0, 0);
	} else {
		//Recreate pauseSurface from pauseSurfaceBuffer
		pauseSurface = surface_create(window_get_width(), window_get_height()); 
		buffer_set_surface(pauseSurfaceBuffer, pauseSurface, 0);
	}
	//Reset what surface to draw to
	surface_reset_target();
}

//Check if pause trigger is activated if not return
if(!pauseTrigger) {
	//Reset blending
	gpu_set_blendenable(true);
	return;
}

//Turn off pause trigger
pauseTrigger = false;

//Flip pause state
pause = !pause;

//Check if game is paused
if(pause) {
	//Create list of all currently active instances and deactivate them
	with (all) {
	    if(id != other.callerID and id != other.id) {
			ds_list_add(other.activeInstances, id);
			instance_deactivate_object(id);
		}
	}
	
	//Create pauseSurface and draw currently showing surface on it
	pauseSurface = surface_create(window_get_width(), window_get_height()); 
	surface_set_target(pauseSurface);
	draw_surface(application_surface, 0, 0);
	//Reset what surface to draw to
	surface_reset_target();
	
	//Check if pauseSurfaceBuffer exist if so delete it
	if(buffer_exists(pauseSurfaceBuffer)) buffer_delete(pauseSurfaceBuffer);
	
	//Create pauseSurfaceBuffer and fill it with pauseSurface data
	pauseSurfaceBuffer = buffer_create(window_get_width()*window_get_height()*4, buffer_fixed, 1);
	buffer_get_surface(pauseSurfaceBuffer, pauseSurface, 0);
	
} else {
	
	//Reactivate all instances in activeInstances list
	for(var i = 0; i < ds_list_size(activeInstances); i++) {
		var inst = ds_list_find_value(activeInstances, i);
		instance_activate_object(inst);
	}
	
	//clear activeInstances list
	ds_list_clear(activeInstances);
	
	//Check if surface exist if so free surface
	if(surface_exists(pauseSurface)) surface_free(pauseSurface);
	
	//Check if buffer exist if so delete buffer
	if(buffer_exists(pauseSurfaceBuffer)) buffer_delete(pauseSurfaceBuffer);
}

//Reset blending
gpu_set_blendenable(true);