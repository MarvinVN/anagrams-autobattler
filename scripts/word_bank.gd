class_name WordBank
extends Node

@export var words: Dictionary = {}
var file: FileAccess

func _init():
	var file = FileAccess.open("res://resources/word_bank.txt", FileAccess.READ)
	while file.eof_reached() == false:
		var word = file.get_line().strip_edges()
		if word != "":
			words[word] = true
	file.close()
