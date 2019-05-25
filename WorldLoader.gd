extends Node

const Field = preload("res://World/Field.tscn")

var data = {}


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
		
func generateWorldBasedOnLoadedData(node: Node2D):
	for field in data:
		var f = Field.instance()
		f.constructor(field)
		node.add_child(f)