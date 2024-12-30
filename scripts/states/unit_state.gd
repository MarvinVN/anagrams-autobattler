class_name UnitState
extends State

@export var unit: Unit

func move_to_target_pos(delta) -> void:
	unit.pathfind_component.follow_path(delta)
	unit.velocity_component.move(unit)
