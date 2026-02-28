extends Node

var points = 0
@onready var label: Label = $"../CanvasLayer/Control/Label"

func addPoint():
	points += 1
	label.text = "Cheese collected: " + str(points)
	if points == 1:
		get_tree().change_scene_to_file("res://scenes/level_two.tscn")
	if points == 2:
		
