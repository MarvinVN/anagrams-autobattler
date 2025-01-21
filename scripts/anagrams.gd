class_name Anagrams
extends Node2D

signal valid_word_submission(word_length, team)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_valid_word(word_length: int) -> void:
	#TODO: figure out team stuff
	valid_word_submission.emit(word_length, 1)
