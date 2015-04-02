Bat = class()

function Bat:init()
    -- you can accept and set parameters here
    self.x = WIDTH/2
    self.y = 50
    self.width = 100
    self.height = 20
end

function Bat:draw()
    rect(self.x,50,self.width,self.height)
end

