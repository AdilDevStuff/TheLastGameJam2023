class_name Units
extends Area2D

@export_category("Stats")
@export var health: float
@export var damage: float
@export var fire_rate: float

@export var bullet_scene: PackedScene

func shoot(bullet_spawn_position: Vector2):
	var bullet_instance = bullet_scene.instantiate()
	bullet_instance.position = bullet_spawn_position
	get_parent().add_child(bullet_instance)
