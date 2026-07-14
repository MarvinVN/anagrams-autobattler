class_name Autobattler
extends Node2D

signal give_modifier(team: int)
signal match_over(winning_team: int)

@onready var unit_manager := $UnitManager

func spawn_unit(word_length: int, team: int) -> void:
	unit_manager.spawn_unit(word_length, team)

func _on_give_modifier(team: int) -> void:
	give_modifier.emit(team)

func _on_base_destroyed(losing_team: int) -> void:
	var winning_team := 2 if losing_team == 1 else 1
	match_over.emit(winning_team)
