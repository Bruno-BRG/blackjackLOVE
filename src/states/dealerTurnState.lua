local DealerTurnState = {
    name = "DealerTurnState"
}

function DealerTurnState:new()
    local state = {}
    setmetatable(state, { __index = DealerTurnState })
    return state
end

function DealerTurnState:enter(gameState)
    -- Reveal dealer's hole card
end

function DealerTurnState:update(dt, gameState)
    -- Dealer must hit on 16 or below, stand on 17 or above
    local dealerValue = self:calculateHandValue(gameState.dealer.hand)
    if dealerValue < 17 then
        -- Hit
        local card = gameState.deck:drawCard()
        table.insert(gameState.dealer.hand, card)
    else
        -- Move to evaluation state
        return "EvaluationState"
    end
end

function DealerTurnState:draw(gameState)
    -- Draw dealer's hand
end

function DealerTurnState:calculateHandValue(hand)
    -- Calculate hand value considering aces
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

return DealerTurnState