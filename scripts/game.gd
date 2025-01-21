class_name Game
extends Node2D

@onready var anagrams := $AnagramsRoot
@onready var autobattler := $AutobattlerRoot

func _on_valid_word_submission(word_length: int, team: int) -> void:
	autobattler.spawn_unit(word_length, team)
