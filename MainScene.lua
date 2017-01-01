
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
--    cc.ui.UILabel.new({
--            UILabelType = 2, text = "Hello, World", size = 64})
--        :align(display.CENTER, display.cx, display.cy)
--        :addTo(self)
	display.newSprite("img/cover.jpg")
	:pos(display.cx,display.cy)
	:addTo(self)

	cc.ui.UIPushButton.new("img/play_button.png")
	:onButtonClicked(function()
		app:enterScene("PlayScene",nil,"Random",2.0)
		end)
	:pos(display.cx, display.cy-200)
	:addTo(self)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
