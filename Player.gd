extends Node2D

var player = 0
var currentField: Node2D


func constructor(playerNumber: int):
	player = playerNumber
	
	#modulate color based on player number
	defaultColor()
	
#func _process(delta):
#	if CurrentTurnState.currentState == CurrentTurnState.SELECT_FIGURE and CurrentTurnState.currentPlayer == player:
#		get_node("Icon").modulate = Color.gold
		
func highlightToTarget():
	get_node("Icon").modulate = Color.pink

func defaultColor():
	get_node("Icon").modulate = PlayerInfo.COLOR[player]