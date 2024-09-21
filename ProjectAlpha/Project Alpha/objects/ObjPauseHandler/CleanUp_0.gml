/// @description Insert description here
// You can write your code in this editor
ds_list_destroy(activeInstances);
if(surface_exists(pauseSurface)) surface_free(pauseSurface);
if(buffer_exists(pauseSurfaceBuffer)) buffer_delete(pauseSurfaceBuffer);