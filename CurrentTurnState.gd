extends Node

var currentPlayer = PlayerInfo.PLAYER1
enum {SELECT_FIGURE, CHOOSE_MOVE_OR_WEAPON, TARGET, ROLL_DICE_TO_HIT, ROLL_DICE_TO_MOVE, CHOOSE_MOVE }

var currentState = SELECT_FIGURE

func isState(state, player):
	if state == currentState and player == currentPlayer:
		return true
	return false

func goToRollDiceToMove():
	if currentState == SELECT_FIGURE:
		currentState = ROLL_DICE_TO_MOVE
		return true
	return false