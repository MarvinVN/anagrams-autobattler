class_name Anagrams
extends Node2D

signal valid_word_submission(word_length, team)

@onready var input_manager := $InputManager
@onready var modifier_manager := $ModifierManager

func _on_valid_word(word_length: int) -> void:
	#TODO: figure out team stuff
	valid_word_submission.emit(word_length, 1)
