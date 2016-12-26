local Forcebar=class("Forcebar")
function Forcebar:ctor()
	self.length_=0
end
function Forcebar:setLength(len)
	self.length_=len
end
function Forcebar:getLength()
	return self.length_
end
function Forcebar:display(beAdded)
	local jindu=display.newProgressTimer("img/forcebarfront.png",display.PROGRESS_TIMER_BAR)    
    	jindu:setPosition(display.left+550,display.bottom+43)
    	jindu:setMidpoint(cc.p(0, 0))
    	jindu:setScale(0.7)
    	jindu:setBarChangeRate(cc.p(1, 0))
    	beAdded:addChild(jindu)
    	jindu:setPercentage(self.length_)
end
return Forcebar