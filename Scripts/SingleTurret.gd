extends Units

func _process(_delta: float) -> void:
	if is_ray_colliding():
		shoot_single_bullet(raycast.global_transform)
