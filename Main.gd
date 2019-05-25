extends Node2D

const WorldLoader = preload("res://WorldLoader.gd")

func _ready():
	
	#load world
	var loader = WorldLoader.new()
	loader.generateWorldBasedOnLoadedData(self)
	
	#set player figures on houses
	