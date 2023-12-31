extends Units
# Inherits from Units class declared in "UnitsBase.gd"


@export var spawn_points: Node2D
var points

func _ready() -> void:
	points = spawn_points.get_children()

func _process(_delta: float) -> void:
	# Shoots two bullets for double turret unit type 
	if is_ray_colliding():
		shoot_double_bullet(points)
