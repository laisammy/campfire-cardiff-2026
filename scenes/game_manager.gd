extends Node

var points = 0

@onready var label: Label = $"../CanvasLayer/Control/Label"
@onready var label_2: Label = $"../CanvasLayer/Control/Label2"

func addPoint():
	print("HEY")
	points = points + 1
	label.text = "Cheese collected: " + str(points)
	print("points: ", str(points))
	
	if points == 1:
		print("Loading level 2")
		get_tree().call_deferred("change_scene_to_file", "res://scenes/level_two.tscn")

	elif points == 2:
		print("Loading level 3")
		get_tree().call_deferred("change_scene_to_file", "res://scenes/level_three.tscn")

	else:
		print("3 points")
		label_2.visible = true
