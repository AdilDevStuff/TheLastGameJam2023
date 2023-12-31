extends TextureButton

@export_category("Properties")
@export var item_name: String
@export var item_price: int
@export var is_unlocked: bool

@export_category("References")
@export var name_label: Label
@export var price_label: Label

func _ready() -> void:
	set_state_texture()
	name_label.text = item_name
	price_label.text = "$%d" % item_price
	pivot_offset = size / 2

func set_state_texture():
	disabled = false if is_unlocked else true
