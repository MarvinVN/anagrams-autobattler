class_name WordBank
extends Node

var words: Dictionary = {}
var words_len6: Dictionary = {}

func _ready() -> void:
	init_word_bank()
	init_word_bank_len6()

func get_random_word() -> String:
	return words_len6.keys().pick_random()

func init_word_bank():
	var file = FileAccess.open("res://resources/word_bank.txt", FileAccess.READ)
	while file.eof_reached() == false:
		var word = file.get_line().strip_edges()
		if word != "":
			words[word] = true
	file.close()

func init_word_bank_len6():
	var file = FileAccess.open("res://resources/word_bank_length_6.txt", FileAccess.READ)
	while file.eof_reached() == false:
		var word = file.get_line().strip_edges()
		if word != "":
			words_len6[word] = true
	file.close()
