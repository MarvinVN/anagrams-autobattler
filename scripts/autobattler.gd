class_name Autobattler
extends Node2D

signal give_modifier(team: int)

@onready var unit_manager := $UnitManager

func spawn_unit(word_length: int, team: int) -> void:
	unit_manager.spawn_unit(word_length, team)

func _on_give_modifier(team: int) -> void:
	give_modifier.emit(team)
