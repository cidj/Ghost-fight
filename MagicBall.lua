local Ball=import(".Ball")
local MagicBall=class("MagicBall",Ball)
function MagicBall:ctor()
MagicBall.super.ctor(self)
	self.type_=1
	self.time_=0
	self.g_=-1
end
function MagicBall:initBall(BallPosition,BallSpeed)
	self.position_=BallPosition
	self.speed_=BallSpeed
end
function MagicBall:getSpriteName()
	return "img/magicball.png"
end
return MagicBall