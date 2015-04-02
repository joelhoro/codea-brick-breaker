Ball = class()

function Ball:init(x,y)
    -- you can accept and set parameters here
    self.x = x
    self.y = y
    self.r = 20
    self.vx = 0
    self.vy = 0
end

function Ball:setSpeed(vx,vy)
    self.vx = vx
    self.vy = vy
end

function Ball:CheckCollisions()
    local shift = math.random(-1,1)*0.2
 --   print(shift)
    -- check if we hit the left or right wall
    if self.x + self.r > WIDTH or self.x - self.r < 0 then
        self.vx = -self.vx + shift
        log:print("Collision at "..self.x..","..self.y)
        sound(SOUND_BLIT, 5452)
    end
    if self.y + self.r > HEIGHT then
        self.vy = -self.vy + shift
        log:print("Collision at "..self.x..","..self.y)
        sound(SOUND_BLIT, 5446)
    end
    
    if self.y < 0 then
        sound("Game Sounds One:Wrong")
    end
    
    if self.y - self.r < bat.y+bat.height then
        if self.x>bat.x and self.x<bat.x+bat.width then
            self.vy= -self.vy
            sound(SOUND_POWERUP, 5446)
        end
    end
    
    for i,b in ipairs(bricks) do
        if b.alive and (math.abs(self.x-b.x) + math.abs(self.y-b.y) < b.width ) then
            b.alive = false
            sound(SOUND_HIT, 5446)
            n = 0
            for j,b2 in ipairs(bricks) do
                if b2.alive then
                    n = n+1
                end
            end
            log:print("Brick hit! "..n.." bricks left")
            self.vy = -self.vy
        end
    end
    
    
end

function Ball:draw()
    self:CheckCollisions()
    self.x = self.x + self.vx
    self.y = self.y + self.vy
    sprite()
    ellipse(self.x,self.y,self.r*2)
    text(math.floor(1/DeltaTime),WIDTH-10,HEIGHT-10)
end

