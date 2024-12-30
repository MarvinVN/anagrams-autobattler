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

func get_middle_letter_position() -> Vector2:
	var x = 0
	var y = 0
	var positions = get_letter_positions()
	for position in positions:
		x += position.x
		y = position.y
	x /= positions.size()
	return Vector2(x,y)

func set_found_word_percentage(percentage: float) -> void:
	found_words_percentage.value = percentage
