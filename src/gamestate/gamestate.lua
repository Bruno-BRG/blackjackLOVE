local Gamestate = {}

function Gamestate:new()
	local gamestate = {
		draw,
		playing,
		winning,
		losing,
		startgame,
	}

	setmetatable(gamestate, { __index = Gamestate })
	return gamestate
end

return Gamestate
