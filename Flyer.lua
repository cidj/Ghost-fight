local Enemy=import(".Enemy")
local Flyer=class("Flyer",Enemy)
function Flyer:ctor()
Flyer.super.ctor(self)
self.type_=2
end
function Flyer:setInitPosition()
	self.position_=cc.p(display.right,display.top-100+math.random(1,20))
	self.speed_=math.random(1,3)
end
function Flyer:getSpriteName()
	return "img/flyer.png"
end
return Flyer