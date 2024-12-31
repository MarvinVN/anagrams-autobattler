class_name VisionComponent
extends Area2D

@onready var parent_obj := get_parent()
@onready var vision := $CollisionShape2D

var enemies_in_sight := []
var max_view_distance: float:
	set(value):
		vision.shape.radius = value

func get_nearest_enemy_entity() -> Node2D:
	var nearest_enemy = null
	var nearest_distance = null
	
	if enemies_in_sight.is_empty():
		return nearest_enemy
		
	for enemy in enemies_in_sight:
		var pos = parent_obj.global_position
		var enemy_pos = enemy.global_position
		var enemy_distance = pos.distance_to(enemy_pos)
		
		if nearest_distance == null or enemy_distance < nearest_distance:
			nearest_distance = enemy_distance
			nearest_enemy = enemy
	return nearest_enemy

func _on_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		if area.parent_obj.team_component.team != parent_obj.team_component.team:
			enemies_in_sight.append(area)

func _on_area_exited(area: Area2D) -> void:
	enemies_in_sight.erase(area)
