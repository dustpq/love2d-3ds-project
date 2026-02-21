package.path = package.path .. ";libs/?.lua;libs/?/init.lua"

local baton = require("baton")

local gameInput = baton.new {
    controls = {
        left = {'axis:leftx-', 'dpleft'},
        right = {'axis:leftx+', 'dpright'},
        up = {'axis:lefty-', 'dpup'},
        down = {'axis:lefty+', 'dpdown'},

    },
    pairs = {
        rStick = {},
        dpad = {},
        faceButtons = {}
    },
    joystick = love.joystick.getJoysticks()[1] -- Get the first joystick (3DS controls)
}

local menuInput = baton.new {
    controls = {
        left = {'axis:leftx-', 'dpleft'},
        right = {'axis:leftx+', 'dpright'},
        up = {'axis:lefty-', 'dpup'},
        down = {'axis:lefty+', 'dpdown'}
    },
    pairs = {
        dpad = {}
    },
    joystick = love.joystick.getJoysticks()[1] -- Get the first joystick (3DS controls)
}

function ReturnPlayerInput(player)
    if player.state == "game" then
        return gameInput
    elseif player.state == "menu" then
        return menuInput
    end
end