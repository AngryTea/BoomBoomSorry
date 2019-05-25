extends Node2D

var x = 0
var y = 0
var next = []
var  id = 0

func constructor(field_info):
	self.x = field_info.x
	self.y = field_info.y
	self.next = field_info.next
	
	self.position.x = x + 30
	self.position.y = y + 30
	self.name = str(field_info.id)
	
	


