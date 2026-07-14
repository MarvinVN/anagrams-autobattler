class_name Game
extends Node2D

const PLAYER_TEAM := 1

@onready var anagrams := $AnagramsRoot
@onready var autobattler := $AutobattlerRoot
@onready var game_over := $GameOver

func _ready() -> void:
	game_over.restart_requested.connect(_on_restart_requested)

func _on_valid_word_submission(word_length: int, team: int) -> void:
	autobattler.spawn_unit(word_length, team)

func _on_give_modifier(team: int) -> void:
	# The 50%-health comeback modifier only rewards the human player (team 1).
	if team != PLAYER_TEAM:
		return
	anagrams.modifier_manager.give_random_mod(anagrams.input_manager)

func _on_match_over(winning_team: int) -> void:
	get_tree().paused = true
	game_over.show_result(winning_team == PLAYER_TEAM)

func _on_restart_requested() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
