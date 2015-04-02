Brick = class()

function Brick:init(x,y)
    self.x = x
    self.y = y
    self.width = 80
    self.height = 40
    self.alive = true
end

function Brick:draw()
    if self.alive then
        rect(self.x,self.y,self.width,self.height)
    end
end

