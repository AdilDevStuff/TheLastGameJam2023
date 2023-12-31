class_name Enemies
extends Area2D

@export_category("Enemy Stats")
@export var move_speed: float
@export var fire_rate: float
@export var health: float

func _process(delta: float) -> void:
	move(delta)
	if health <= 0:
		queue_free()

func move(delta):
	position.x -= move_speed * delta
