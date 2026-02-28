extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
@onready var game_manager: Node = %GameManager


func _on_area_2d_body_entered(body: Node2D) -> void:
	game_manager.addPoint()
	print("BRIE")
	self.queue_free()
