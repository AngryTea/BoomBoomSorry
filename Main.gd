extends Node2D

const WorldLoader = preload("res://WorldLoader.gd")
const Player = preload("res://Player.tscn")

func _ready():
	
	#load world
	var loader = WorldLoader.new()
	loader.generateWorldBasedOnLoadedData(get_node("Fields"), get_node("Houses"), get_node("Bases"))	
	setPlayerInHouses()
	
func setPlayerInHouses():
	for base in get_node("Bases").get_children():
		var player = Player.instance()
		player.constructor(base.playerNumber)
		base.add_child(player)