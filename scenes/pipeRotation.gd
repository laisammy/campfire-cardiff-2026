extends Node2D

@onready var pipe1: Node2D = $"."
@onready var label: Label = $RotateDisplay/Label
@onready var rotate_display: CanvasLayer = $RotateDisplay
@onready var player: Node2D = $"../Player"   # adjust if needed

var playerInRange = false
var degreesIncrement = 90

var origin_position: Vector2
var origin_rotation: float

func _ready():
	origin_position = position
	origin_rotation = rotation_degrees
	rotate_display.visible = false

func _process(delta):
	var moved = position.distance_to(origin_position) > 0.1
	var rotated = rotation_degrees != origin_rotation
	rotate_display.visible = moved or rotated

	if playerInRange and Input.is_action_just_pressed("rotatePipe"):
		rotatePipe()

func rotatePipe():
	rotation_degrees += degreesIncrement

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		playerInRange = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player:
		playerInRange = false
