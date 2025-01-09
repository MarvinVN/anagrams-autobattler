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

func remove_health_bar() -> void:
	visible = false

func _on_health_change() -> void:
	update_current_health()

func _on_health_below_zero() -> void:
	remove_health_bar()
