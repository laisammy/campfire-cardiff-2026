extends Node2D

@onready var pipe1: Node2D = $"."
@onready var rotate_display: Sprite2D = $rotateDisplay

var playerInRange = false

var degreesIncrement = 90

func _ready():
	rotate_display.visible = false
	
	if rotation_degrees == 90:
		rotate_display.rotation_degrees = 270
	elif rotation_degrees == 180:
		rotate_display.rotation_degrees = 180
	elif rotation_degrees == 270:
		rotate_display.rotation_degrees = 90
	elif rotation_degrees == 360:
		rotation_degrees = 0
		rotate_display.rotation_degrees = 0
	else:
		print("Error with rotatePipe, invalid degree.")

func _process(_delta):
	if playerInRange:
		if Input.is_action_just_pressed("rotatePipe"):
			rotatePipe()

func rotatePipe():
	rotation_degrees += degreesIncrement
	if rotation_degrees == 90:
		rotate_display.rotation_degrees = 270
	elif rotation_degrees == 180:
		rotate_display.rotation_degrees = 180
	elif rotation_degrees == 270:
		rotate_display.rotation_degrees = 90
	elif rotation_degrees == 360:
		rotation_degrees = 0
		rotate_display.rotation_degrees = 0
	else:
		print("Error with rotatePipe, invalid degree.")

func _on_rotate_area_body_entered(_body: Node2D) -> void:
	print("ENTER")
	playerInRange = true
	rotate_display.visible = true


func _on_rotate_area_body_exited(_body: Node2D) -> void:
	print("EXIT")
	playerInRange = false
	rotate_display.visible = false
