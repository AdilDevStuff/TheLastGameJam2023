extends Units

@export var muzzle: Node2D
var is_alarmed: bool = false

@onready var enemy = get_tree().get_first_node_in_group("Enemies")

func _process(_delta: float) -> void:
	if is_alarmed:
		muzzle.look_at(enemy.position)
		muzzle.rotation_degrees = wrapf(muzzle.rotation_degrees, -360, 360)
	else:
		muzzle.rotation = lerpf(muzzle.rotation, 0, 0.2)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemies"):
		is_alarmed = true
