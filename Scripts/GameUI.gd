extends Control

# < ---------- VARIABLES ---------- >

@export_category("Items bar")
@export var item_slot: HBoxContainer
@export var interface_anims: AnimationPlayer
@export var items_bar: PanelContainer

@export_category("User Stats")
@export var coinsLabel: Label

# < ---------- FUNCTIONS ---------- >

func _ready() -> void:
	items_bar.size.x = get_viewport_rect().size.x
	
	for interface in self.get_children():
		if interface is Control:
			interface.mouse_entered.connect(_on_mouse_entered)
			interface.mouse_exited.connect(_on_mouse_exited)
	
	# Get all buttons from the ItemSlot HBoxContainer and connect mouse entered and exited signal
	var buttons = item_slot.get_children()
	for button in buttons:
		button.mouse_entered.connect(_on_mouse_entered)
		button.mouse_exited.connect(_on_mouse_exited)

func _process(_delta: float) -> void:
	coinsLabel.text = "%d" % Global.coins

# < ---------- SIGNALS ---------- >

func _on_build_mode_btn_toggled(toggled_on: bool) -> void:
	if toggled_on:
		interface_anims.play_backwards("Enter")
		Global.is_in_build_mode = true
	else:
		Global.is_in_build_mode = false
		interface_anims.play("Enter")

func _on_mouse_entered():
	Global.mouse_on_gui = true

func _on_mouse_exited():
	Global.mouse_on_gui = false

func _on_build_mode_btn_mouse_entered() -> void:
	Global.mouse_on_gui = true

func _on_build_mode_btn_mouse_exited() -> void:
	Global.mouse_on_gui = false
