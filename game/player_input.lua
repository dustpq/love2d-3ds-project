package.path = package.path .. ";libs/?.lua;libs/?/init.lua"

local baton = require("baton")

local bindings = {

    --3DS controls (hopefully)
    analogLeft = {'axis:leftx-'},
    analogRight = {'axis:leftx+'},
    analogUp = {'axis:lefty-'},
    analogDown = {'axis:lefty+'},

    dpLeft = {'button:dpleft'},
    dpRight = {'button:dpright'},
    dpUp = {'button:dpup'},
    dpDown = {'button:dpdown'},

    buttonA = {'button:a'},
    buttonB = {'button:b'},
    buttonX = {'button:x'},
    buttonY = {'button:y'},

    shoulderR = {'button:shoulderr'},
    shoulderL = {'button:shoulderl'},

    buttonStart = {'button:start'},
    buttonSelect = {'button:select'},

    --New 3DS controls
    buttonZR = {'button:triggerright'},
    buttonZL = {'button:triggerleft'},

    --Keyboard bindings (for testing on PC)
    keyLeft = {'key:a'},
    keyRight = {'key:d'},
    keyUp = {'key:w'},
    keyDown = {'key:s'},

    keyA = {'key:k'},
    keyB = {'key:m'},
    keyX = {'key:j'},
    keyY = {'key:i'},

    keyR = {'key:q'},
    keyL = {'key:e'}

}

local gameInput = baton.new {
    controls = bindings,
    pairs = {
        left = {'analogLeft', 'dpLeft', 'keyLeft'},
        right = {'analogRight', 'dpRight', 'keyRight'},
        up = {'analogUp', 'dpUp', 'keyUp'},
        down = {'analogDown', 'dpDown', 'keyDown'},

        move = {'left', 'right', 'up', 'down'},
        action = {'buttonB', 'keyB'},
        slow = {'buttonX', 'keyX'},
    },
    joystick = love.joystick.getJoysticks()[1], -- Get the first joystick (3DS controls)
    deadzone = .25, -- Set a deadzone for analog inputs
}

local menuInput = baton.new {
    controls = bindings,
    pairs = {
        left = {'analogLeft', 'dpLeft', 'keyLeft'},
        right = {'analogRight', 'dpRight', 'keyRight'},
        up = {'analogUp', 'dpUp', 'keyUp'},
        down = {'analogDown', 'dpDown', 'keyDown'},

        move = {'left', 'right', 'up', 'down'},
        confirm = {'buttonA', 'keyA'},
        cancel = {'buttonB', 'keyB'},
    },
    joystick = love.joystick.getJoysticks()[1], -- Get the first joystick (3DS controls)
    deadzone = .33, -- Set a deadzone for analog inputs
}

function ReturnPlayerInput(player)
    if player.state == "game" then
        return gameInput
    elseif player.state == "menu" then
        return menuInput
    end
end