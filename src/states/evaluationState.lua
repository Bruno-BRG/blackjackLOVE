local EvaluationState = {
    name = "EvaluationState"
}

function EvaluationState:new()
    local state = {}
    setmetatable(state, { __index = EvaluationState })
    return state
end

function EvaluationState:enter(gameState)
    -- Evaluate hands and determine winners
    local playerTotal = self:calculateHandValue(gameState.player.hands[gameState.player.currentHand])
    local dealerTotal = self:calculateHandValue(gameState.dealer.hand)
    
    if playerTotal > 21 then
        gameState.player.busted = true
    elseif dealerTotal > 21 then
        gameState.dealer.busted = true
    end
    
    return "PayoutState"
end

function EvaluationState:calculateHandValue(hand)
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

return EvaluationState