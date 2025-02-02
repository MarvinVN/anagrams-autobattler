class_name UnitSpawnMenu
extends Panel

@onready var unit_manager := $"../UnitManager"

func _on_a_3_pressed() -> void:
	unit_manager.spawn_unit(3,1)

func _on_a_4_pressed() -> void:
	unit_manager.spawn_unit(4,1)

func _on_a_5_pressed() -> void:
	unit_manager.spawn_unit(5,1)

func _on_a_6_pressed() -> void:
	unit_manager.spawn_unit(3,1)

func _on_b_3_pressed() -> void:
	unit_manager.spawn_unit(3,2)

func _on_b_4_pressed() -> void:
	unit_manager.spawn_unit(4,2)

func _on_b_5_pressed() -> void:
	unit_manager.spawn_unit(5,2)

func _on_b_6_pressed() -> void:
	unit_manager.spawn_unit(3,2)
