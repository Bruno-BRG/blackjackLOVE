local Deck = {}
Deck.__index = Deck

function Deck.new()
    local self = setmetatable({}, Deck)
    self.cards = {}
    self.discardPile = {}
    
    -- Create deck data
    local suits = {"hearts", "diamonds", "clubs", "spades"}
    local values = {"A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"}
    
    -- Populate deck with card data
    for _, suit in ipairs(suits) do
        for _, value in ipairs(values) do
            table.insert(self.cards, {
                suit = suit,
                value = value,
                -- Calculate blackjack value
                bjValue = (value == "A") and 11 or
                         (value == "J" or value == "Q" or value == "K") and 10 or
                         tonumber(value)
            })
        end
    end
    
    return self
end

function Deck:shuffle()
    for i = #self.cards, 2, -1 do
        local j = math.random(i)
        self.cards[i], self.cards[j] = self.cards[j], self.cards[i]
    end
end

function Deck:drawCard()
    if #self.cards == 0 then
        -- Reshuffle discard pile if deck is empty
        self.cards = self.discardPile
        self.discardPile = {}
        self:shuffle()
    end
    return table.remove(self.cards)
end

return Deck
