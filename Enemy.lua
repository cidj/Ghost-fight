local Enemy=class("Enemy")
function Enemy:ctor()
	self.position_=cc.p(display.left,display.bottom+50)
	self.speed_=10
	self.type_=1
	self.collision_=0
end
function Enemy:getPosition()
	return self.position_.x,self.position_.y
end
function Enemy:getSpeed()
	return self.speed_
end
function Enemy:getType()
	return self.type_
end
function Enemy:getCollision()
	return self.collision_
end
function Enemy:increaseCollision()
	self.collision_=self.collision_+1
end
function Enemy:step()
	self.position_=cc.p(self.position_.x-self.speed_, self.position_.y)
end
function Enemy:outScene()
	local x,y= self:getPosition()
--	local left,bottom=cc.p(display.left,display.bottom)
--	local right,top=cc.p(display.right,display.top)
	local m= x<display.left-100 or x>display.right+100 or y<display.bottom-100 or y> display.top+100
	return m
end
return Enemy