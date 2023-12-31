class_name Enemies
extends Area2D

@export var move_speed: float
@export var fire_rate: float
@export var health: float

func _process(delta: float) -> void:
	print(health)
	move(delta)

func move(delta):
	position.x -= move_speed * delta
