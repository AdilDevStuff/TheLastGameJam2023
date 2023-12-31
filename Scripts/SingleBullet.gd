extends Bullets

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		area.health -= damage
		visible = false
