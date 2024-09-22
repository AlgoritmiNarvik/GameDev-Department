/// @description Insert description here
// You can write your code in this editor
gpu_set_blendenable(false);

if(pause) {
	surface_set_target(application_surface);
	if(surface_exists(pauseSurface)) {
		draw_surface(pauseSurface, 0, 0);
	} else {
		pauseSurface = surface_create(window_get_width(), window_get_height()); 
		buffer_set_surface(pauseSurfaceBuffer, pauseSurface, 0);
	}
	surface_reset_target();
}
if(!pauseTrigger) {
	gpu_set_blendenable(true);
	return;
}
pauseTrigger = false;
pause = !pause;

if(pause) {
	with (all) {
	    if(id != other.callerID and id != other.id) {
			ds_list_add(other.activeInstances, id);
			instance_deactivate_object(id);
		}
	}
	
	pauseSurface = surface_create(window_get_width(), window_get_height()); 
	surface_set_target(pauseSurface);
	draw_surface(application_surface, 0, 0);
	surface_reset_target();
	
	if(buffer_exists(pauseSurfaceBuffer)) buffer_delete(pauseSurfaceBuffer);
	pauseSurfaceBuffer = buffer_create(window_get_width()*window_get_height()*4, buffer_fixed, 1);
	buffer_get_surface(pauseSurfaceBuffer, pauseSurface, 0);
	
} else {
	for(var i = 0; i < ds_list_size(activeInstances); i++) {
		var inst = ds_list_find_value(activeInstances, i);
		instance_activate_object(inst);
	}
	ds_list_clear(activeInstances);
	if(surface_exists(pauseSurface)) surface_free(pauseSurface);
	if(buffer_exists(pauseSurfaceBuffer)) buffer_delete(pauseSurfaceBuffer);
}

gpu_set_blendenable(true);