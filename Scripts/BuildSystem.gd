extends Node2D

@export_category("Build System")
@export var placeable_units: Array[PackedScene]
@export var units_texture: Array[Texture]
@export var grid_size: Vector2

@export_group("Item Indicator Colors")
@export var valid_place_color: Color
@export var invalid_place_color: Color

@export_category("References")
@export var spawned_units: Node2D
@export var selected_item: Sprite2D

var is_removing: bool = false

func _process(_delta: float) -> void:
	selected_item.position = snap_to_grid(get_global_mouse_position())
	set_indicator_texture()
	set_indicator_color()
	
	if Global.is_in_build_mode and !Global.mouse_on_gui:
		if Input.is_action_just_pressed("Build"):
			spawn_obj(placeable_units[Global.unit_idx])
		if Input.is_action_just_pressed("Remove"):
			remove_obj()

func spawn_obj(obj_to_spawn: PackedScene) -> void:
	Global.can_place_unit = true
	for unit in get_spawned_units():
		if unit.position == snap_to_grid(get_global_mouse_position()):
			Global.can_place_unit = false
	
	if Global.can_place_unit and Global.is_in_build_mode:
		var obj_instance = obj_to_spawn.instantiate()
		obj_instance.position = snap_to_grid(get_global_mouse_position())
		spawned_units.add_child(obj_instance)

func remove_obj():
	for unit in get_spawned_units():
		if unit.position == snap_to_grid(get_global_mouse_position()):
			unit.queue_free()

func set_indicator_color():
	selected_item.modulate = valid_place_color
	for unit in spawned_units.get_children():
		if unit.position == snap_to_grid(get_global_mouse_position()):
			selected_item.modulate = invalid_place_color
			break

func set_indicator_texture():
	selected_item.texture = units_texture[Global.unit_idx]
	if Global.is_in_build_mode and not Global.mouse_on_gui:
		selected_item.visible = true
	else:
		selected_item.visible = false

func get_spawned_units() -> Array:
	return spawned_units.get_children()

func snap_to_grid(spawn_pos):
	var snapped_x = int(spawn_pos.x / grid_size.x) * grid_size.x + grid_size.x / 2
	var snapped_y = int(spawn_pos.y / grid_size.y) * grid_size.y + grid_size.y / 2
	return Vector2(snapped_x, snapped_y)

func _on_item_btn_pressed(index: int) -> void:
	Global.is_in_build_mode = true
	Global.unit_idx = index