// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function normalise(xx, yy) {
	var length = sqrt(xx*xx + yy*yy);
	xx /= length;
	yy /= length;
	return [xx, yy];
}