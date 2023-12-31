class_name Bullets
extends Area2D

@export var speed: float
@export var damage: float

func _process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		area.health -= damage
