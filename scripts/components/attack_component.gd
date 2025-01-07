class_name AttackComponent
extends Area2D

enum attack_type {
	SINGLE_TARGET,
	SPLASH
}

@onready var parent_obj := get_parent()
@onready var attack_area:= $AttackArea

@export var damage: float
@export var type: int

var enemies_in_range := []

func attack() -> void:
	# attack_type enum
	match type:
		0: damage_target(parent_obj.current_target)
		1: damage_area()

func damage_target(target) -> void:
	target.parent_obj.health_component.take_damage(damage)

func damage_area() -> void:
	for enemy in enemies_in_range:
		damage_target(enemy)

func is_target_in_range(target) -> bool:
	return target in enemies_in_range

func _on_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		if area.parent_obj.team_component.team != parent_obj.team_component.team:
			enemies_in_range.append(area)

func _on_area_exited(area: Area2D) -> void:
	enemies_in_range.erase(area)
