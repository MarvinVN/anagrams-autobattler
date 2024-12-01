class_name AnagramsBoard
extends Control

@export var timer: Label
@export var input_row: HBoxContainer 
@export var letter_set_row: HBoxContainer
@export var found_words_percentage: ProgressBar

func get_letter_positions() -> Array:
	var positions = []
	for letter_slot in letter_set_row.get_children():
		positions.append(letter_slot.global_position + Vector2(25, 25))
	return positions

func get_input_positions() -> Array:
	var positions = []
	for letter_slot in input_row.get_children():
		positions.append(letter_slot.global_position + Vector2(25, 25))
	return positions

func set_found_word_percentage(percentage: float) -> void:
	found_words_percentage.value = percentage
