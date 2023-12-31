extends Units
# Inherits from Units class declared in "UnitsBase.gd"

func _process(_delta: float) -> void:
	# Shoots a single bullet for single barrel turret type 
	if is_ray_colliding():
		shoot_single_bullet(raycast.global_transform)
