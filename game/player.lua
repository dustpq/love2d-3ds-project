require("player_input") -- Load player input handling
local ASSET_IMAGE = love.filesystem.getSourceBaseDirectory() .. "/assets/images/"

local player = {
    sprite = love.graphics.newImage(ASSET_IMAGE .. "SOUL.png"),
    x = 100,
    y = 100,
    speed = 200,
    state="game",
    input = nil,
    update=function(self, dt)
        checkInput(self) -- Update the player's input based on their current state
        if self.input.left then
            self.x = self.x - self.speed * dt
        end
        if self.input.right then
            self.x = self.x + self.speed * dt
        end
        if self.input.up then
            self.y = self.y - self.speed * dt
        end
        if self.input.down then
            self.y = self.y + self.speed * dt
        end
    end,
    draw=function(self)
        love.graphics.draw(self.sprite, self.x, self.y)
    end
}

function AddPlayer()
    return player
end

function checkInput(player)
    player.input = ReturnPlayerInput(player)
end