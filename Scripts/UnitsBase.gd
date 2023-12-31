class_name Units
extends Area2D

@export_category("Unit Stats")
@export var health: float
@export var damage: float
@export var fire_rate: float
@export var price: float

@export_group("References")
@export var bullet_scene: PackedScene
@export var raycast: RayCast2D
@export var barrel: Node2D

var can_shoot: bool = false

func _process(delta: float) -> void:
	if is_ray_colliding():
		print("Collided")
	else:
		print("Not Collided")

func shoot(bullet_spawn_position: Vector2):
	if can_shoot:
		var bullet_instance = bullet_scene.instantiate()
		bullet_instance.position = bullet_spawn_position
		get_parent().add_child(bullet_instance)
		can_shoot = false
		await get_tree().create_timer(fire_rate).timeout
		can_shoot = true

func is_ray_colliding():
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.is_in_group("Enemy"):
			return true
	else:
		return false
