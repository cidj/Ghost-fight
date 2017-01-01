
local PlayScene = class("PlayScene", function()
    return display.newScene("PlayScene")
end)

local Game = import("..models.Game")
-- local Forcebar=import("..models.Forcebar")

function PlayScene:ctor()
	self.game_ = Game.new(self)
	
	display.newSprite("img/star.png")
	:pos(display.left+50,display.top-50)
	:addTo(self)
	:zorder(1)

	display.newSprite("img/background.jpg")
	:pos(display.cx,display.cy)
	:addTo(self)

	cc.ui.UILabel.new({text="5",size=32,x=display.left+90,y=display.top-50})
	:addTo(self)

	display.newSprite("img/player.png")
	:pos(display.left+150,display.bottom+150)
	:addTo(self)

    -- jindu0=display.newProgressTimer("img/forcebarback.png",display.PROGRESS_TIMER_BAR)    
    -- jindu0:setPosition(display.left+550,display.bottom+43)
    -- jindu0:setMidpoint(cc.p(0, 0))
    -- jindu0:setScale(0.7)
    -- jindu0:setBarChangeRate(cc.p(1, 0))
    -- self:addChild(jindu0)
    -- jindu0:setPercentage(100)

    -- forcebar=Forcebar.new()
    -- forcebar:setLength(50)
    -- forcebar:display(self)

    display.newSprite("img/angleringb.png")
    :pos(display.left+150,display.bottom+150)
    :scale(0.2)
    :zorder(1)
    :addTo(self)

end

function PlayScene:onEnter()

	self:schedule(function()
    self.game_:step()
    end, 0.1)

    self.game_:addEnemy()
    self:schedule(function()
    self.game_:addEnemy()
    end, 6)

    self:setTouchEnabled(true)
    self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
    return self.game_:onTouch(event)
    end)

end

function PlayScene:onExit()
end

return PlayScene
