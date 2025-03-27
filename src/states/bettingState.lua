local BettingState = {
    name = "BettingState"
}

function BettingState:new()
    local state = {}
    setmetatable(state, { __index = BettingState })
    return state
end

function BettingState:enter(gameState)
    -- Reset game state for new round
    gameState.player.bet = 0
    gameState.player.busted = false
    gameState.player.hasBlackjack = false
    gameState.dealer.busted = false
    gameState.dealer.hand = {}
    for i = 1, #gameState.player.hands do
        gameState.player.hands[i] = {}
    end
end

function BettingState:update(dt, gameState)
    -- Handle betting input
    if gameState.player.bet > 0 then
        return "DealingState"
    end
end

function BettingState:placeBet(amount, gameState)
    if amount <= gameState.player.chips then
        gameState.player.bet = amount
        return true
    end
    return false
end

function BettingState:draw(gameState)
    -- Draw betting interface
end

return BettingState