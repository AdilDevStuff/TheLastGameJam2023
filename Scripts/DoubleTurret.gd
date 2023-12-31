extends Units

@export var spawn_points: Node2D
var points

func _ready() -> void:
	points = spawn_points.get_children()

func _process(_delta: float) -> void:
	if is_ray_colliding():
		shoot_double_bullet(points)
