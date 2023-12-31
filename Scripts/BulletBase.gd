class_name Bullets
extends Area2D

@export var speed: float
@export var damage: float

func _process(delta: float) -> void:
	position += transform.x * speed * delta
	if position.x > get_viewport_rect().size.x:
		queue_free()
