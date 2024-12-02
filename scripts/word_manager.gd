class_name WordManager
extends Node

signal new_letter_set
signal letter_set_shuffled

@onready var timer: Timer = $Timer

@export var board: AnagramsBoard
@export var word_bank: WordBank

const ALPHABET = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
const DEFAULT_TIME: float = 60.0

var letter_set: Array
var letter_set_str_array: Array
var valid_words: Dictionary

func _process(delta: float) -> void:
	board.timer.text = str(timer.time_left).pad_decimals(2)

func reset_board() -> void:
	refresh_letter_set(get_new_word())
	shuffle_letter_set()
	timer.wait_time = DEFAULT_TIME
	timer.start()

func get_new_word() -> String:
	return word_bank.get_random_word()
	
func letter_set_to_str_array(word: String) -> Array:
	var letters_str = []
	for char in letter_set:
		letters_str.append(char)
	return letters_str

func shuffle_letter_set() -> void:
	var new_string = ""
	letter_set_str_array.shuffle()
	for char in letter_set_str_array:
		new_string += char
	update_letter_set(new_string)
	letter_set_shuffled.emit(letter_set)

func update_letter_set(word: String) -> void:
	var letters = []
	var letters_str = []
	for char in word:
		letters.append(Enums.get_letter(char))
		letters_str.append(char)
	letter_set = letters
	letter_set_str_array = letters_str

func refresh_letter_set(word: String) -> void:
	update_letter_set(word)
	new_letter_set.emit(letter_set)
	generate_valid_words()

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

func word_submission(input_manager: InputManager, word: String) -> void:
	var is_valid_word = false
	if word.contains("*"):
		for letter in ALPHABET: 
			var wild_idx = word.find("*")
			var wild_word = word.left(wild_idx) + letter + word.right(word.length()-wild_idx-1)
			is_valid_word = wild_word in word_bank.words
			if is_valid_word:
				break
	else:
		is_valid_word = word in valid_words
	input_manager.word_submission_response(is_valid_word)

func _on_timer_timeout() -> void:
	reset_board()
