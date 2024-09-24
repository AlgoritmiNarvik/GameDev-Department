
// Destroy ds list
ds_list_destroy(activeInstances);

//Check if surface exist if so free surface
if(surface_exists(pauseSurface)) surface_free(pauseSurface);

//Check if buffer exist if so delete buffer
if(buffer_exists(pauseSurfaceBuffer)) buffer_delete(pauseSurfaceBuffer);