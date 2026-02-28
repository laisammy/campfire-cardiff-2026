extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 300.0

@export var speed = 400

func get_input():
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if direction.x < 0:
		animated_sprite.flip_h = true
	elif direction.x > 0:
		animated_sprite.flip_h = false

func _physics_process(delta):
	get_input()
	move_and_slide()
	if velocity.length() > 0.0:
		animated_sprite.play("walk")
	else: 
		animated_sprite.stop()
	
