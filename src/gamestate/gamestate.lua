local Load = {}

function Load:loadGameState()
		local gameState = {
				player = {
						hands = {},
						chips = 1000,
						bet = 0,
						insuranceBet = 0,
						blackjack = false,
						busted = false,
						hasBlackjack = false,
				},
				dealer = {
						hand = {},
						busted = false,
				},
				deck = {
						cards = {},
						discardPile = {},
				},
				gameOver = false,
		}

		return gameState
end


