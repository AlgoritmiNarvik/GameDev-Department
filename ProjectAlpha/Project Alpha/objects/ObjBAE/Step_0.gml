/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(target)) {
	var dis = -1
	for(var i = 0; i < 4; i++) if(instance_exists(playerHandler.players[i])) {
		var tempDis = sqrt((playerHandler.players[i].x - x)*(playerHandler.players[i].x - x) + (playerHandler.players[i].y - y)*(playerHandler.players[i].y - y));
		if(tempDis < dis or dis == -1) target = playerHandler.players[i];
	}
	if(dis == -1) return;
}
if(alarm[0] < 0) alarm[0] = fps/10;
if(alarm[1] >= 0) {
	velocityX *= 0.8;
	velocityY *= 0.8;
}
x += moveSpeed*delta_time/100000*velocityX;
y += moveSpeed*delta_time/100000*velocityY;