class_name PlayerPanel
extends Control

@onready var modifier_icon = $VBoxContainer/Modifier/Sprite2D

var modifier_icons: Dictionary

func _init() -> void:
	init_icons()

func _ready() -> void:
	modifier_icon.position = global_position + Vector2(30,40)
	modifier_icon.scale = Vector2(1.25, 1.25)
	modifier_icon.texture = modifier_icons["empty"]
	
func update_modifier_icon(modifier: int) -> void:
	if modifier in Enums.Modifiers.values():
		modifier_icon.texture = modifier_icons[modifier]
	else:
		modifier_icon.texture = modifier_icons["empty"]

func set_modifier_icon(modifier: int) -> void:
	pass

func init_icons() -> void:
	modifier_icons = {
		Enums.Modifiers.ADD_LETTER: preload("res://assets/modifiers/add-letter-icon.png"),
		Enums.Modifiers.FREEZE: preload("res://assets/modifiers/freeze-icon.png"),
		Enums.Modifiers.LOCK: preload("res://assets/modifiers/lock-icon.png"),
		Enums.Modifiers.WILD_CARD: preload("res://assets/modifiers/wild-card-icon.png"),
		"empty": preload("res://assets/modifiers/empty-mod-icon.png")
	}

func _on_modifier_change(modifier: int) -> void:
	update_modifier_icon(modifier)
