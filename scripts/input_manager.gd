class_name InputManager
extends Node

signal submit_word_input

@export var word_manager: WordManager
@export var letters_manager: LettersManager
@export var board: AnagramsBoard

var current_input: Array = []

func _ready() -> void:
	submit_word_input.connect(word_manager.word_submission)

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		handle_input(event)

func submit_word() -> void:
	var word = ""
	for char in current_input:
		word += char
	submit_word_input.emit(word)

func clear_current_input() -> void:
	current_input.clear()

func letter_input(letter: String) -> void:
	var letter_tile = letters_manager.get_available_letter_tile(letter)
	if letter_tile:
		current_input.append(letter)
		letters_manager.update_tile_state(letter_tile, Enums.TileStates.USED)
		
		var input_positions = board.get_input_positions()
		letters_manager.update_tile_position(letter_tile, input_positions[current_input.size()-1])

func handle_input(event: InputEventKey) -> void:
	match event.keycode:
		KEY_ENTER:
			submit_word()
		KEY_BACKSPACE:
			if current_input.is_empty():
				return
			var letter = current_input.pop_back()
			var letter_tile = letters_manager.get_used_letter_tile(letter)
			letters_manager.update_tile_state(letter_tile, Enums.TileStates.AVAILABLE)
			letters_manager.update_tile_position(letter_tile, letter_tile.letter_set_position)
			
		KEY_A: 
			letter_input("a")
		KEY_B:
			letter_input("b")
		KEY_C:
			letter_input("c")
		KEY_D:
			letter_input("d")
		KEY_E:
			letter_input("e")
		KEY_F:
			letter_input("f")
		KEY_G:
			letter_input("g")
		KEY_H:
			letter_input("h")
		KEY_I:
			letter_input("i")
		KEY_J:
			letter_input("j")
		KEY_K:
			letter_input("k")
		KEY_L:
			letter_input("l")
		KEY_M:
			letter_input("m")
		KEY_N:
			letter_input("n")
		KEY_O:
			letter_input("o")
		KEY_P:
			letter_input("p")
		KEY_Q:
			letter_input("q")
		KEY_R:
			letter_input("r")
		KEY_S:
			letter_input("s")
		KEY_T:
			letter_input("t")
		KEY_U:
			letter_input("u")
		KEY_V:
			letter_input("v")
		KEY_W:
			letter_input("w")
		KEY_X:
			letter_input("x")
		KEY_Y:
			letter_input("y")
		KEY_Z:
			letter_input("z")
	print(current_input)

func _on_new_letter_set(letter_set: Array) -> void:
	clear_current_input()
