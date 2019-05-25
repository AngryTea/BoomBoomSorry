extends Node2D

const WorldLoader = preload("res://WorldLoader.gd")

func _ready():
	var loader = WorldLoader.new()
	loader.generateWorldBasedOnLoadedData(self)