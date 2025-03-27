local Cards = require "src.entities.card"
local Hands = require "src.entities.hands"

local cards = {}

function love.load()
    cards[1] = Cards:new("hearts", "02")
end

function love.update(dt)

end

function love.draw()
    Hands:draw()
end
