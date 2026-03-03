require("player_input") -- Load player input handling

local function handle_movement(player, dt)
    if player.input:down('move') then
        local moveX, moveY = player.input:get('move')
        player.x = player.x + moveX * player.speed * dt
        player.y = player.y + moveY * player.speed * dt
    end
end

local function handle_menu_navigation(player, dt)
    -- Implement menu navigation logic here using player.input
end

local function checkInput(player)
    player.input = ReturnPlayerInput(player)
end

local player = {
    sprite = nil,
    x = 100,
    y = 100,
    speed = 200,
    state = "game",
    input = nil,
    update = function(player, dt)
        checkInput(player) -- Update the player's input based on their current states
        if player.state == "game" then
            handle_movement(player, dt)
        elseif player.state == "menu" then
            handle_menu_navigation(player, dt)
        end
    end,
    draw = function(player)
        love.graphics.draw(player.sprite, player.x, player.y)
    end
}

function AddPlayer()
    if player.sprite == nil then
        player.sprite = love.graphics.newImage("assets/images/SOUL.png")
    end
    return player
end