class_name HealthComponent
extends Node

signal health_change
signal health_below_zero

@export var max_health: float

func _ready() -> void:
	current_health = max_health

var current_health: float:
	set(value):
		current_health = value
		health_change.emit()
		if is_dead():
			health_below_zero.emit()

func set_max_health(health: float) -> void:
	max_health = health
	current_health = max_health

func take_damage(damage: float) -> void:
	current_health -= damage

func get_health_percentage() -> float:
	return (current_health / max_health) * 100.0

func is_dead() -> bool:
	return current_health <= 0
