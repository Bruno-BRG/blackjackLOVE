local GameOverState = {
    name = "GameOverState"
}

function GameOverState:new()
    local state = {}
    setmetatable(state, { __index = GameOverState })
    return state
end

function GameOverState:enter(gameState)
    -- Check if player has any chips left
    if gameState.player.chips <= 0 then
        gameState.gameOver = true
    end
end

function GameOverState:update(dt, gameState)
    -- Handle restart game input
    -- If player wants to restart, reset chips and return to betting state
    if love.keyboard.isDown('r') then
        gameState.player.chips = 1000
        gameState.gameOver = false
        return "BettingState"
    end
end

function GameOverState:draw(gameState)
    -- Draw game over screen
    love.graphics.print("Game Over! Press R to restart", 300, 250)
    love.graphics.print("Final Chips: " .. gameState.player.chips, 300, 280)
end

return GameOverState