-- Brickbreaker

-- Use this function to perform your initial setup
function setup()
    ball = Ball(200,300)
 --   ball2 = Ball(600,300)
    ball:setSpeed(10,10)
 --   ball2:setSpeed(15,15)
    bat = Bat()

    log = Log("Brick")
    
    bricks = {}
    log:print("Creating bricks")
    for x = 80,700,90 do
        for y = 500,700,45 do
            bricks[#bricks+1] = Brick(x,y)
        end
    end
    
    parameter.number("dummy",0,WIDTH,changeBatPosition)
    parameter.boolean("autopilot")
    autopilot = true
    
end


function changeBatPosition(value)
    bat.x = value
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)

    -- This sets the line thickness
    strokeWidth(5)
    if autopilot then
        bat.x = ball.x - bat.width/2
    end
    ball:draw()
    bat:draw()
 
    for i,b in ipairs(bricks) do
--        print("drawing brick ",i)
        b:draw()
    end
    
end

