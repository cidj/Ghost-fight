local Enemy=import(".Enemy")
local Walker=class("Walker",Enemy)
function Walker:ctor()
Walker.super.ctor(self)
self.type_=1
end
function Walker:setInitPosition()
	self.position_=cc.p(display.right,display.bottom+100+math.random(1,40))
	self.speed_=math.random(2,4)
end
function Walker:getSpriteName()
	return "img/walker.png"
end
return Walker