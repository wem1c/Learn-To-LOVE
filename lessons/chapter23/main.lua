function love.load()
    -- Load the classes library
    Object = require "lib.classic"
    -- Load the base classes
    require "class.entity"
    require "class.player"
    require "class.wall"
    require "class.box"

    player = Player(100, 100)
    wall = Wall(200, 100)
    box = Box(400, 150)

    objects = {}
    table.insert(objects, player)
    table.insert(objects, wall)
    table.insert(objects, box)
end

function love.update(dt)
    -- Update all the objects
    for i,v in ipairs(objects) do
        v:update(dt)
    end

    local loop = true
    local limit = 0

    while loop do
        -- Set loop to false, if no collision happened it will stay false
        loop = false

        limit = limit + 1
        if limit > 100 then
            -- Still not done at loop 100
            -- Break it because we're probably stuck in an endless loop.
            break
        end

        for i=1,#objects-1 do
            for j=i+1,#objects do
                loop = objects[i]:resolveCollision(objects[j])
            end
        end
    end
end

function love.draw()
    -- Draw all the objects
    for i,v in ipairs(objects) do
        v:draw()
    end
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.push('quit') -- Quit the game.
    end
end