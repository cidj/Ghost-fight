local Game=class("Game")
local Walker=import(".Walker")
local Flyer=import(".Flyer")
local MagicBall=import(".MagicBall")
Game.INIT_STARS = 5
Game.BALL_HIT_ENEMY_EVENT = "BALL_HIT_ENEMY_EVENT"
Game.PLAYER_DEAD_EVENT = "PLAYER_DEAD_EVENT"
function Game:ctor(stage)
	self.stage_=stage
	self.stars_ = Game.INIT_STARS
	self.enemies_={}
	self.enemiesSprite_={}
	self.deadCount=0
	cc(self):addComponent("components.behavior.EventProtocol"):exportMethods()
    self.balls_={}
    self.ballsSprite_={}
    self.disballsCount=0
end
function Game:getStars()
    return self.stars_
end

function Game:getDeadCount()
    return self.deadCount_
end
function Game:getdisballsCount()
    return self.disballsCount_
end
function Game:addEnemy()
    local enemy
    if math.random(1, 2) % 2 == 0 then
        enemy = Walker.new()
    else
        enemy = Flyer.new()
    end
    enemy:setInitPosition()

    self.enemies_[#self.enemies_ + 1] = enemy

    local sprite = display.newSprite(enemy:getSpriteName())
        :pos(enemy:getPosition())
        :addTo(self.stage_)
    self.enemiesSprite_[#self.enemiesSprite_ + 1] = sprite
end
function Game:addBall(ballp,ballv)
    local ball= MagicBall.new()
    ball:initBall(ballp,ballv)

    self.balls_[#self.balls_ + 1] = ball

    local sprite = display.newSprite(ball:getSpriteName())
        :pos(ball:getPosition())
        :addTo(self.stage_)
    self.ballsSprite_[#self.ballsSprite_ + 1] = sprite
end
function Game:ballHitEnemy_(pEnemy, pBall)
    local x1,y1=pEnemy:getPosition()
    local x2,y2=pBall:getPosition()
    local offset = math.sqrt((x1-x2)^2+(y1-y2)^2)
    return offset<=50
end
function Game:playerDead_()
    
end
function Game:step()
    if self.stars_ <= 0 then return end


    for i = #self.enemies_, 1, -1 do
        local enemy = self.enemies_[i]
        enemy:step()

        local sprite = self.enemiesSprite_[i]
        sprite:pos(enemy:getPosition())
    end
    for i = #self.balls_, 1, -1 do
        local ball = self.balls_[i]
        ball:step()
        local sprite = self.ballsSprite_[i]
        sprite:pos(ball:getPosition())
    end

    for i = #self.enemies_, 1, -1 do
        local enemy = self.enemies_[i]
        local spriteEnemy = self.enemiesSprite_[i]
        spriteEnemy:pos(enemy:getPosition())  

        for j = #self.balls_, 1, -1 do
            local ball = self.balls_[j]
            local spriteBall = self.ballsSprite_[j]
            spriteBall:pos(ball:getPosition())
            if self:ballHitEnemy_(enemy,ball) then
                enemy:increaseCollision()
                ball:increaseCollision()                
            end
        end
    end

    for i = #self.enemies_, 1, -1 do
        local enemy = self.enemies_[i]
        local spriteEnemy = self.enemiesSprite_[i]
        if enemy:getCollision()>0 or enemy:outScene() then
            transition.fadeOut(spriteEnemy, {
                time = 0.5,
                delay = 0.5,
                onComplete = function()
                    spriteEnemy:removeSelf()
                end})  
            table.remove(self.enemies_, i)
            table.remove(self.enemiesSprite_, i)      
        end
    end
    for i = #self.balls_, 1, -1 do
        local ball = self.balls_[i]
        local spriteBall = self.ballsSprite_[i]
        if ball:getCollision() or ball:outScene()  then
            transition.fadeOut(spriteBall, {
                time = 0.5, 
                delay = 0.5,
                onComplete = function()
                    spriteBall:removeSelf()
                end})  
            table.remove(self.balls_, i)
            table.remove(self.ballsSprite_, i)
        end      
    end
end
function Game:onTouch(event)
    if self.stars_ <= 0 then return end

    if event.name == "began" then
        local pos=cc.p(event.x,event.y)
        print(event.x,event.y)
        local vel={0,0}
        self:addBall(pos,vel)
    end

    return false
end


return Game