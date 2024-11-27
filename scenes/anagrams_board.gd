class_name AnagramsBoard
extends Control

@export var input_row: HBoxContainer 
@export var letter_set_row: HBoxContainer

var a: Vector2 = Vector2.ZERO

func get_letter_positions() -> Array:
	var positions = []
	for letter_slot in letter_set_row.get_children():
		positions.append(letter_slot.global_position)
	return positions
