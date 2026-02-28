extends Node

var points = 0
@onready var label: Label = $"../CanvasLayer/Control/Label"

func addPoint():
	points += 1
	label.text = "Cheese collected: " + points
