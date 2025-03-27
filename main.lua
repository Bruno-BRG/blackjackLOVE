-- Game states
local StateMachine = require "src.states.stateMachine"
local BettingState = require "src.states.bettingState"
local DealingState = require "src.states.dealingState"
local PlayerTurnState = require "src.states.playerTurnState"
local DealerTurnState = require "src.states.dealerTurnState"
local EvaluationState = require "src.states.evaluationState"
local PayoutState = require "src.states.payoutState"
local GameOverState = require "src.states.gameOverState"

-- Game components
local Deck = require "src.entities.deck"
local GameState = require "src.gamestate.gamestate"

local stateMachine
local gameState

function love.load()
    -- Initialize game state
    gameState = GameState:loadGameState()
    gameState.deck = Deck.new()
    gameState.deck:shuffle()
    
    -- Initialize state machine with all states
    local states = {
        BettingState = BettingState,
        DealingState = DealingState,
        PlayerTurnState = PlayerTurnState,
        DealerTurnState = DealerTurnState,
        EvaluationState = EvaluationState,
        PayoutState = PayoutState,
        GameOverState = GameOverState
    }
    
    -- Start with betting state
    stateMachine = StateMachine:new(states, "BettingState", gameState)
end

function love.update(dt)
    stateMachine:update(dt)
end

function love.draw()
    stateMachine:draw()
end
