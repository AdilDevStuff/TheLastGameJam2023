extends TextureButton

@export_category("Properties")
@export var item_name: String
@export var item_price: int
@export var is_unlocked: bool

@export_category("References")
@export var name_label: Label
@export var price_label: Label

@onready var build_system: Node2D = get_tree().get_first_node_in_group("Build System")
@onready var item_buttons: Array = get_tree().get_nodes_in_group("ItemButton")

func _ready() -> void:
	name_label.text = item_name
	price_label.text = "$%d" % item_price
	pivot_offset = size / 2

func set_state_texture():
	disabled = false if is_unlocked else true
