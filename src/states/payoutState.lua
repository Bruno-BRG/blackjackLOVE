local PayoutState = {
    name = "PayoutState"
}

function PayoutState:new()
    local state = {}
    setmetatable(state, { __index = PayoutState })
    return state
end

function PayoutState:enter(gameState)
    local playerTotal = self:calculateHandValue(gameState.player.hands[gameState.player.currentHand])
    local dealerTotal = self:calculateHandValue(gameState.dealer.hand)
    
    -- Calculate winnings
    if gameState.player.busted then
        gameState.player.chips = gameState.player.chips - gameState.player.bet
    elseif gameState.dealer.busted or playerTotal > dealerTotal then
        if gameState.player.hasBlackjack then
            gameState.player.chips = gameState.player.chips + (gameState.player.bet * 1.5)
        else
            gameState.player.chips = gameState.player.chips + gameState.player.bet
        end
    elseif playerTotal < dealerTotal then
        gameState.player.chips = gameState.player.chips - gameState.player.bet
    end
    -- Equal scores result in a push, no chips exchanged
    
    return "BettingState"
end

function PayoutState:calculateHandValue(hand)
    local value = 0
    local aces = 0
    
    for _, card in ipairs(hand) do
        if card.value == "A" then
            aces = aces + 1
            value = value + 11
        else
            value = value + card.bjValue
        end
    end
    
    while value > 21 and aces > 0 do
        value = value - 10
        aces = aces - 1
    end
    
    return value
end

return PayoutState