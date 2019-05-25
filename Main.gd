extends Node2D

const WorldLoader = preload("res://WorldLoader.gd")
const Player = preload("res://Player.tscn")

func _ready():
	
	#load world
	var loader = WorldLoader.new()
	loader.generateWorldBasedOnLoadedData(get_node("Fields"), get_node("Houses"), get_node("Bases"))
	
#	self.print_tree_pretty()
	
	
	#set player on an node
	var pos = get_node("Fields/22").position
	var player = Player.instance()
	player.constructor(PlayerInfo.PLAYER1)
	player.position = pos
	add_child(player)