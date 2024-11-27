class_name LettersManager
extends Node

@export var board: AnagramsBoard

@onready var letter_tiles: Array = get_children()


func update_tile_positions() -> void:
	var positions = board.get_letter_positions()
	print(positions)
	var count = 0
	for letter_tile in letter_tiles:
		letter_tile.position = positions[count]
		count += 1

func update_all_tile_letters(letter_set: Array) -> void:
	update_tile_positions()
	var letter_set_string = Enums.get_letter_string(letter_set)
	var count = 0
	for letter_tile in letter_tiles:
		update_tile_letter(letter_tile, letter_set_string[count])
		count += 1
	
func update_tile_letter(letter_tile: LetterTile, letter: String):
	letter_tile.set_letter(letter)

func _on_new_letter_set(letter_set: Array) -> void:
	update_all_tile_letters(letter_set)
