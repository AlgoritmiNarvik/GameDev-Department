/// @description Insert description here
// You can write your code in this editor
hitBoxID = instance_create_depth(x,y, depth, objPlayerHitBox);
hitBoxID.image_xscale = 2;
hitBoxID.image_yscale = 2;
instance_deactivate_object(hitBoxID);