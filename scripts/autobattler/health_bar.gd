class_name HealthBar
extends ProgressBar

@export var health_component: HealthComponent

func _init() -> void:
	value = 100
	visible = false

func update_current_health() -> void:
	value = health_component.get_health_percentage()
	if value < 100:
		visible = true

func _on_health_change() -> void:
	update_current_health()
