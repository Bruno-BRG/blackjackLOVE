local StateMachine = {
    states = {},
    current = nil,
    gameState = nil
}

function StateMachine:new(states, initialState, gameState)
    local machine = {}
    setmetatable(machine, { __index = StateMachine })
    
    machine.states = states
    machine.gameState = gameState
    machine.current = machine.states[initialState]:new()
    
    if machine.current.enter then
        machine.current:enter(machine.gameState)
    end
    
    return machine
end

function StateMachine:update(dt)
    if self.current.update then
        local nextState = self.current:update(dt, self.gameState)
        if nextState then
            self:changeState(nextState)
        end
    end
end

function StateMachine:draw()
    if self.current.draw then
        self.current:draw(self.gameState)
    end
end

function StateMachine:changeState(nextStateName)
    if self.states[nextStateName] then
        self.current = self.states[nextStateName]:new()
        if self.current.enter then
            self.current:enter(self.gameState)
        end
    end
end

return StateMachine