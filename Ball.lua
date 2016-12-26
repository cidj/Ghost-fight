local Ball=class("Ball")
function Ball:ctor()
	self.position_=cc.p(display.cx,display.cy)
	self.type_=1
	self.speed_={0,0}
	self.time_=0
	self.g_=-10
	self.collision_=false
end
function Ball:getPosition()
	return self.position_.x,self.position_.y
end
function Ball:getSpeed()
	return self.speed_[1],self.speed_[2]
end
function Ball:getType()
	return self.type_
end
function Ball:getTime()
	return self.time_
end
function Ball:getG()
	return self.g_
end
function Ball:getCollision()
	return self.collision_
end
function Ball:increaseCollision()
	self.collision_=true
end
function Ball:step()
	self.time_=self.time_+1
	self.speed_[1]=self.speed_[1]
	self.speed_[2]=self.speed_[2]+self.g_
	self.position_=cc.p(self.position_.x+self.speed_[1],self.position_.y+self.speed_[2]+0.5*self.g_*self.time_^2)

end
function Ball:outScene()
	local x,y= self:getPosition()
	local m= x<display.left-100 or x>display.right+100 or y<display.bottom-100 or y> display.top+100
	return m
end
return Ball