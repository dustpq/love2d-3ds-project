-- Add the libs directory to the package path so that libs can be used
package.path = package.path .. ";game/libs/?.lua;game/libs/?/init.lua"

-- Load and initialize the nest library for 3DS mode
require("nest").init({
    console = "3ds",  -- Enable 3DS mode
    scale = 1,        -- Scale the window size (1x by default)
    emulateJoystick = true  -- Enable joystick emulation via keyboard
})

require("player") -- Load the player module, which includes player input handling

function love.load()
    -- Load assets and initialize game state here
    ---@diagnostic disable-next-line: undefined-field
    love.graphics.set3D(false)
    Player = AddPlayer() -- Create the player object
end

function love.update(dt)-- Update game logic here
    Player.update(dt)
end

function love.draw(screen)
    if screen == "left" then
        local width, height = love.graphics.getDimensions(screen)
        love.graphics.print("this da top (left) screen", width / 2, height / 2)
        love.graphics.setBackgroundColor(0.5, 0.5, 0.5) -- Set background color to gray
        Player.draw()

    elseif screen == "bottom" then
        local width, height = love.graphics.getDimensions(screen)
        love.graphics.print("this da bottom screen", width / 2, height / 2)
        love.graphics.setBackgroundColor(0.2, 0.2, 0.2) -- Set background color to dark gray
    end
end