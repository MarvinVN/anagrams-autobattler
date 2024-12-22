class_name LettersManager
extends Node

@export var board: AnagramsBoard

@onready var letter_tiles: Array = get_children()

var letter_sprites: Dictionary

func _init() -> void:
	init_letter_sprites()

func get_random_tile() -> LetterTile:
	return letter_tiles.pick_random()

func update_tile_state(letter_tile: LetterTile, tile_state: int) -> void:
	letter_tiles[letter_tiles.find(letter_tile)].state = tile_state

func update_all_tile_states(tile_state: int) -> void:
	for letter_tile in letter_tiles:
		letter_tile.state = tile_state

func update_all_tile_states_by_list(states: Array) -> void:
	var count = 0
	for letter_tile in letter_tiles:
		letter_tile.state = states[count]
		count += 1

func set_all_tiles_available() -> void:
	for letter_tile in letter_tiles:
		if letter_tile.state in [Enums.TileStates.WILD, Enums.TileStates.WILD_USED]:
			letter_tile.state = Enums.TileStates.WILD
		else:
			letter_tile.state = Enums.TileStates.AVAILABLE

func get_available_letter_tile(letter: String) -> LetterTile:
	var locked_letter_tile = null
	for letter_tile in letter_tiles:
		if letter_tile.letter == letter: 
			match letter_tile.state:
				Enums.TileStates.AVAILABLE: return letter_tile
				Enums.TileStates.LOCKED: locked_letter_tile = letter_tile
				Enums.TileStates.FROZEN:
					var position = letter_tile.position
					var tween = create_tween()
					tween.tween_property(letter_tile, "position", position+Vector2(5,0), 0.05)
					tween.tween_property(letter_tile, "position", position-Vector2(5,0), 0.05)
					tween.tween_property(letter_tile, "position", position, 0.05).set_trans(Tween.TRANS_BOUNCE)
					break
	if locked_letter_tile:
		var tween = create_tween()
		tween.tween_property(locked_letter_tile, "rotation_degrees", 20, 0.05)
		tween.tween_property(locked_letter_tile, "rotation_degrees", -20, 0.05)
		tween.tween_property(locked_letter_tile, "rotation_degrees", 0, 0.05).set_trans(Tween.TRANS_BOUNCE)
	return null

func get_used_letter_tile_from_back(letter: String) -> LetterTile:
	var letter_tiles_reverse = []
	for x in letter_tiles:
		letter_tiles_reverse.push_front(x)
	for letter_tile in letter_tiles_reverse:
		if letter_tile.state == Enums.TileStates.USED and letter_tile.letter == letter:
			return letter_tile
		if letter_tile.state == Enums.TileStates.WILD_USED and letter in Enums.UPPER_ALPHABET:
			return letter_tile
	return null

func update_tile_position(letter_tile: LetterTile, position: Vector2) -> void:
	var tween = create_tween()
	tween.tween_property(letter_tile, "position", position, 0.05).from_current()

func update_all_tile_positions() -> void:
	var positions = board.get_letter_positions()
	var count = 0
	for letter_tile in letter_tiles:
		update_tile_position(letter_tile, positions[count])
		letter_tile.letter_set_position = positions[count]
		count += 1

func reset_all_tile_positions() -> void:
	for letter_tile in letter_tiles:
		update_tile_position(letter_tile, letter_tile.letter_set_position)

func update_all_tile_letters(letter_set: Array) -> void:
	update_all_tile_positions()
	var letter_set_string = Enums.get_letter_string(letter_set)
	var count = 0
	for letter_tile in letter_tiles:
		update_tile_letter(letter_tile, letter_set_string[count])
		count += 1
	
func update_tile_letter(letter_tile: LetterTile, letter: String) -> void:
	letter_tile.set_letter(letter)

func clear_tile_modifiers() -> void:
	for letter_tile in letter_tiles:
		if letter_tile.state == Enums.TileStates.WILD_USED:
			letter_tile.state = Enums.TileStates.USED
		if letter_tile.state not in [Enums.TileStates.AVAILABLE, Enums.TileStates.USED]:
			letter_tile.state = Enums.TileStates.AVAILABLE

func get_all_tile_states() -> Array:
	var states = []
	for letter_tile in letter_tiles:
		states.append(letter_tile.state)
	return states

func reset_all_tile_sprites() -> void:
	for letter_tile in letter_tiles:
		letter_tile.set_sprite()

func get_wild_card_tile() -> LetterTile:
	for letter_tile in letter_tiles:
		if letter_tile.state in [Enums.TileStates.WILD, Enums.TileStates.WILD_USED] :
			return letter_tile
	return null

func is_letters_frozen() -> bool:
	for letter_tile in letter_tiles:
		if letter_tile.state != Enums.TileStates.FROZEN:
			return false
	return true

func has_wild_card() -> bool:
	for letter_tile in letter_tiles:
		if letter_tile.state == Enums.TileStates.WILD:
			return true
	return false

func _on_letters_change(letter_set: Array) -> void:
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
