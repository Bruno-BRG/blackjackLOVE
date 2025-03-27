local Cards = require "src.entities.card"

local Deck = {}
local suits = Cards.suits
local value = Cards.values

function Deck:new()
    local deck = {
        cards = {},
    }

    for _, suit_value in pairs(suits) do
        for card_number = 1, 13 do
            local deck_value
            if card_number == 1 then
                deck_value = value.ACE
            elseif card_number == 11 then
                deck_value = value.JACK
            elseif card_number == 12 then
                deck_value = value.QUEEN
            elseif card_number == 13 then
                deck_value = value.KING
            else
                deck_value = card_number
            end

            table.insert(deck.cards, Cards:new(suit_value, deck_value))
        end
    end

    setmetatable(deck, self)
    self.__index = self
    return deck
end

return Deck
