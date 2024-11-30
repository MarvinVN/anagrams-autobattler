class_name LettersManager
extends Node

@export var board: AnagramsBoard

@onready var letter_tiles: Array = get_children()

var letter_sprites: Dictionary

func _init() -> void:
	init_letter_sprites()

func update_tile_state(letter_tile: LetterTile, tile_state: int) -> void:
	letter_tiles[letter_tiles.find(letter_tile)].state = tile_state

func update_all_tile_states(tile_state: int) -> void:
	for letter_tile in letter_tiles:
		letter_tile.state = tile_state

func get_available_letter_tile(letter: String) -> LetterTile:
	for letter_tile in letter_tiles:
		if letter_tile.letter == letter and letter_tile.state == Enums.TileStates.AVAILABLE:
			return letter_tile
	return null

func get_used_letter_tile(letter: String) -> LetterTile:
	for letter_tile in letter_tiles:
		if letter_tile.letter == letter and letter_tile.state == Enums.TileStates.USED:
			return letter_tile
	return null

func update_tile_position(letter_tile: LetterTile, position: Vector2) -> void:
	letter_tile.position = position

func update_all_tile_positions() -> void:
	var positions = board.get_letter_positions()
	var count = 0
	for letter_tile in letter_tiles:
		letter_tile.position = positions[count]
		letter_tile.letter_set_position = letter_tile.position
		count += 1

func reset_all_tile_positions() -> void:
	for letter_tile in letter_tiles:
		letter_tile.position = letter_tile.letter_set_position

func update_all_tile_letters(letter_set: Array) -> void:
	update_all_tile_positions()
	var letter_set_string = Enums.get_letter_string(letter_set)
	var count = 0
	for letter_tile in letter_tiles:
		update_tile_letter(letter_tile, letter_set_string[count])
		count += 1
	
func update_tile_letter(letter_tile: LetterTile, letter: String):
	letter_tile.set_letter(letter)

func _on_new_letter_set(letter_set: Array) -> void:
	update_all_tile_letters(letter_set)
	
func init_letter_sprites() -> void:
	letter_sprites = {
		"a": preload("res://assets/tiles/a-tile.png"),
		"b": preload("res://assets/tiles/b-tile.png"),
		"c": preload("res://assets/tiles/c-tile.png"),
		"d": preload("res://assets/tiles/d-tile.png"),
		"e": preload("res://assets/tiles/e-tile.png"),
		"f": preload("res://assets/tiles/f-tile.png"),
		"g": preload("res://assets/tiles/g-tile.png"),
		"h": preload("res://assets/tiles/h-tile.png"),
		"i": preload("res://assets/tiles/i-tile.png"),
		"j": preload("res://assets/tiles/j-tile.png"),
		"k": preload("res://assets/tiles/k-tile.png"),
		"l": preload("res://assets/tiles/l-tile.png"),
		"m": preload("res://assets/tiles/m-tile.png"),
		"n": preload("res://assets/tiles/n-tile.png"),
		"o": preload("res://assets/tiles/o-tile.png"),
		"p": preload("res://assets/tiles/p-tile.png"),
		"q": preload("res://assets/tiles/q-tile.png"),
		"r": preload("res://assets/tiles/r-tile.png"),
		"s": preload("res://assets/tiles/s-tile.png"),
		"t": preload("res://assets/tiles/t-tile.png"),
		"u": preload("res://assets/tiles/u-tile.png"),
		"v": preload("res://assets/tiles/v-tile.png"),
		"w": preload("res://assets/tiles/w-tile.png"),
		"x": preload("res://assets/tiles/x-tile.png"),
		"y": preload("res://assets/tiles/y-tile.png"),
		"z": preload("res://assets/tiles/z-tile.png"),
		"wild": preload("res://assets/tiles/wild-tile.png"),
		"smile": preload("res://assets/tiles/smile-tile.png"),
		"empty": preload("res://assets/tiles/empty-tile.png"),
		null: preload("res://assets/tiles/empty-tile.png")
	}
