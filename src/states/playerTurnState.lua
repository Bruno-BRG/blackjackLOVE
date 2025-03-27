local PlayerTurnState = {
    name = "PlayerTurnState"
}

function PlayerTurnState:new()
    local state = {}
    setmetatable(state, { __index = PlayerTurnState })
    return state
end

function PlayerTurnState:enter(gameState)
    -- Called when entering this state
end

function PlayerTurnState:update(dt, gameState)
    -- Handle player actions: hit, stand, double, split
end

function PlayerTurnState:draw(gameState)
    -- Draw player's hand and options
end

function PlayerTurnState:hit(gameState)
    -- Handle hit action
end

function PlayerTurnState:stand(gameState)
    -- Handle stand action
    -- Transition to DealerTurnState
end

return PlayerTurnState