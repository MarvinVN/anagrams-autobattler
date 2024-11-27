class_name WordManager
extends Node

signal new_letter_set

@export var board: AnagramsBoard
@export var letters_manager: LettersManager
@export var word_bank: WordBank

var letter_set: Array
var letter_set_str_array: Array
var valid_words: Dictionary

func _ready() -> void:
	new_letter_set.connect(letters_manager._on_new_letter_set)
	#refresh_letter_set()

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			refresh_letter_set()

func refresh_letter_set() -> void:
	var word = word_bank.get_random_word()
	var letters = []
	var letters_str = []
	for char in word:
		letters.append(Enums.get_letter(char))
		letters_str.append(char)
	letter_set = letters
	letter_set_str_array = letters_str
	new_letter_set.emit(letter_set)
	generate_valid_words()
	
	print(letter_set_str_array)
	
func generate_valid_words() -> void:
	var valid_word_set = {}
	var letters = letter_set_str_array
	for x in range(1, letter_set.size() + 1):
		generate_words("", letters, 0, valid_word_set)
	valid_words = valid_word_set
	
func generate_words(word: String, remaining_letters: Array, current_idx: int, valid_word_set: Dictionary) -> void:
	if current_idx == len(word):
		if word_bank.words.has(word):
			valid_word_set[word] = true
			
	for i in range(remaining_letters.size()):
		var next_word = word + remaining_letters[i]
		var next_remaining = remaining_letters.slice(0, i) + remaining_letters.slice(i + 1, remaining_letters.size())
		generate_words(next_word, next_remaining, current_idx+1, valid_word_set)
