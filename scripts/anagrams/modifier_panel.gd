class_name ModifierPanel
extends Control

const MODIFIER_DISPLAY_TEXT = " modifier activated!"

@onready var label: Label = $VBoxContainer/Label
@onready var progress_bar: ProgressBar = $VBoxContainer/ProgressBar

func show_panel() -> void:
	visible = true

func hide_panel() -> void:
	visible = false

func update_modifier_text(modifier_str: String) -> void:
	label.text = modifier_str + MODIFIER_DISPLAY_TEXT

func update_timer_progress_bar(time_left: float, wait_time: float) -> void:
	var time_percentage = 100 * time_left / wait_time
	progress_bar.set_value_no_signal(time_percentage)
