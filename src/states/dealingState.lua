local DealingState = {
    name = "DealingState"
}

function DealingState:new()
    local state = {}
    setmetatable(state, { __index = DealingState })
    return state
end

function DealingState:enter(gameState)
    -- Deal initial cards
    -- First card to player
    table.insert(gameState.player.hands[1], gameState.deck:drawCard())
    -- First card to dealer (face up)
    table.insert(gameState.dealer.hand, gameState.deck:drawCard())
    -- Second card to player
    table.insert(gameState.player.hands[1], gameState.deck:drawCard())
    -- Second card to dealer (face down)
    table.insert(gameState.dealer.hand, gameState.deck:drawCard())
    
    -- Check for player blackjack
    if self:calculateHandValue(gameState.player.hands[1]) == 21 then
        gameState.player.hasBlackjack = true
        return "DealerTurnState"
    end
    
    return "PlayerTurnState"
end

function DealingState:calculateHandValue(hand)
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

return DealingState