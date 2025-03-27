local Cards = {}

Cards.suits = {
    HEARTS = "hearts",
    DIAMONDS = "diamonds",
    CLUBS = "clubs",
    SPADES = "spades"
}

Cards.values = {
    ACE = { value = 1, name = "A" },
    TWO = { value = 2, name = "02" },
    THREE = { value = 3, name = "03" },
    FOUR = { value = 4, name = "04" },
    FIVE = { value = 5, name = "05" },
    SIX = { value = 6, name = "06" },
    SEVEN = { value = 7, name = "07" },
    EIGHT = { value = 8, name = "08" },
    NINE = { value = 9, name = "09" },
    TEN = { value = 10, name = "10" },
    JACK = { value = 10, name = "J" },
    QUEEN = { value = 10, name = "Q" },
    KING = { value = 10, name = "K" }
}

function Cards:new(suit, value)
    local card = {
        suit = suit,
        value = value,
    }
    setmetatable(card, { __index = Cards })
    return card
end

function Cards:getValue()
    return self.value
end

function Cards:draw(x, y)
    local filename = "assets/card_" .. self.suit .. "_" .. self.value .. ".png"
    local image = love.graphics.newImage(filename)
    love.graphics.draw(image, x, y)
end

return Cards
