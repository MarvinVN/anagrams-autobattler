class_name GameOver
extends CanvasLayer

signal restart_requested

@onready var result_label: Label = %ResultLabel
@onready var restart_button: Button = %RestartButton

func _ready() -> void:
	visible = false
	restart_button.pressed.connect(_on_restart_pressed)

func show_result(player_won: bool) -> void:
	result_label.text = "VICTORY!" if player_won else "DEFEAT"
	visible = true

func _on_restart_pressed() -> void:
	restart_requested.emit()
