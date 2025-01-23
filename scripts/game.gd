class_name Game
extends Node2D

@onready var anagrams := $AnagramsRoot
@onready var autobattler := $AutobattlerRoot

func _on_valid_word_submission(word_length: int, team: int) -> void:
	autobattler.spawn_unit(word_length, team)

func _on_give_modifier(team: int) -> void:
	#TODO: figure out team stuff
	print(team)
	anagrams.modifier_manager.give_random_mod(anagrams.input_manager)
