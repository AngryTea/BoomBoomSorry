extends Node2D

const WorldLoader = preload("res://WorldLoader.gd")
const Player = preload("res://Player.tscn")

var playerDict = { PlayerInfo.PLAYER1: [], PlayerInfo.PLAYER2: [], PlayerInfo.PLAYER3: [], PlayerInfo.PLAYER4: [] }
var selectedPlayerIndex = -1
var selectedPlayer

func _ready():
	
	#load world
	var loader = WorldLoader.new()
	loader.generateWorldBasedOnLoadedData(get_node("Fields"), get_node("Houses"), get_node("Bases"))	
	setPlayerInHouses()
	
func setPlayerInHouses():
	for base in get_node("Bases").get_children():
		var player = Player.instance()
		player.constructor(base.playerNumber)

		player.position = base.global_position
		player.currentField = base
		get_node("Players").add_child(player) 
		playerDict[player.player].append( player)


func _input(event):
	if CurrentTurnState.isState(CurrentTurnState.SELECT_FIGURE, PlayerInfo.PLAYER1):
		if Input.is_action_pressed("P1_right"):
			#reset player colors
			for i in playerDict[PlayerInfo.PLAYER1]:
				i.defaultColor()
			
			selectedPlayerIndex = (selectedPlayerIndex +1) % 4 
			currentPlayer().highlightToTarget()
		if Input.is_action_pressed("P1_accept"):
			CurrentTurnState.goToRollDiceToMove()
			rollDice()
		
func currentPlayer():
	return playerDict[CurrentTurnState.currentPlayer][selectedPlayerIndex]

func rollDice():
	var diceRoll = (randi() % 6) + 1 #1-6
	print(diceRoll)
	#calculate possible routes
	var next = currentPlayer().currentField
	var i = 0
	while i < diceRoll:
		#check for dividing paths and if the next elemeent is zero
		next = find_node(str(next.next[0]), true, false)
		print(next.get_name())
		i += 1