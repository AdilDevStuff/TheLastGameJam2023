class_name Bullets
extends Area2D

@export var speed: float

func _process(delta: float) -> void:
	position += transform.x * speed * delta
