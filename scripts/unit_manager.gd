class_name UnitManager
extends Node

var unit_list: Array = []

func spawn_unit(word_length: int) -> Unit:
	var new_unit: Unit
	match word_length:
		3: pass
		4: pass
		5: pass
		6: pass
	unit_list.append(new_unit)
	return new_unit

func destroy_unit(unit: Unit) -> void:
	unit_list.erase(unit)
	unit.queue_free()
