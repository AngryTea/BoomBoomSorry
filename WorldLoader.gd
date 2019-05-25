extends Node

const Field = preload("res://World/Field.tscn")
const PlayerField = preload("res://World/PlayerField.tscn")

var data = []


func _init():
	var file = File.new()
	file.open("res://World/sample.json", file.READ)
	var text = file.get_as_text()
	var result_json =  JSON.parse(text)
	
	if result_json.error == OK:  # If parse OK
		data = result_json.result
	else:  # If parse has errors
		print("Error: ", result_json.error)
		print("Error Line: ", result_json.error_line)
		print("Error String: ", result_json.error_string)
		
func generateWorldBasedOnLoadedData(fields: Node2D, houses: Node2D, bases: Node2D):
	for field in data:
		var f 

		if field.type == "house":
			f = PlayerField.instance()
			f.constructor(field)
			houses.add_child(f)
		elif field.type == "base":
			f = PlayerField.instance()
			f.constructor(field)
			bases.add_child(f)
		else:
			f = Field.instance()
			f.constructor(field)
			fields.add_child(f)