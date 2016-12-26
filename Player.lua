local Player=class("Player")
function Player:ctor()
	self.position_=cc.p(display.left+100,display.bottom+100)
	self.speed_=0
	self.angle_=45
	self.force_=45
end
function Player:getPosition()
	return self.position_.x,self.position_.y
end
function Player:getSpeed()
	return self.speed_
end
function Player:getAngle()
	return self.angle_
end
function Player:setAngle(degree)
	self.angle_=degree
end
function Player:getForce()
	return self.force_
end
function Player:setForce(length)
	self.force_=length
end
function Flyer:getSpriteName()
	return "img/player.png"
end
function Player:step()
end
return Player