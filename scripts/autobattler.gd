class_name Autobattler
extends Node2D

@onready var unit_manager := $UnitManager

func spawn_unit(word_length: int, team: int) -> void:
	unit_manager.spawn_unit(word_length, team)
 
