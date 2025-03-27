local Card = require "src.entities.card"
local Hands = {}

function Hands:New()
    local hands = {
        cards = {},
        currentHand = 1,
    }

    setmetatable(hands, { __index = Hands })
    return hands
end

function Hands:draw()
    for i, hand in ipairs(self.hands) do
        hand:draw()
    end
end

return Hands
