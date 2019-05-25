extends Node2D

var player = 0

func constructor(playerNumber: int):
	player = playerNumber
	
	#modulate color based on player number
	get_node("Icon").modulate = PlayerInfo.COLOR[playerNumber]