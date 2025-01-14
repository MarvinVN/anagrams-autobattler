class_name UnitManager
extends Node2D

@export var baseA: Base
@export var baseB: Base

const PAWN = preload("res://scenes/pawn.tscn")
const WARRIOR = preload("res://scenes/warrior.tscn")
var unit_list: Array = []

func spawn_unit(word_length: int, team: int) -> Unit:
	var new_unit: Unit
	match word_length:
		3: new_unit = PAWN.instantiate()
		4: new_unit = WARRIOR.instantiate()
		5: pass
		6: pass
	add_child(new_unit)
	new_unit.team_component.team = team
	if team == 2:
		new_unit.flip_direction()
	new_unit.position = baseA.get_random_spawn_point() if team == 1 else baseB.get_random_spawn_point()
	unit_list.append(new_unit)
	return new_unit

func destroy_unit(unit: Unit) -> void:
	unit_list.erase(unit)
	unit.queue_free()
