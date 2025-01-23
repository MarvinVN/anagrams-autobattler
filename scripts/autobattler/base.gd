class_name Base
extends Area2D

signal give_modifier(team: int)

@export var unit_spawn_area: CollisionShape2D

@onready var health_component := $HealthComponent
@onready var hitbox_component := $HitboxComponent
@onready var team_component := $TeamComponent

var health_below_half := false

func _ready() -> void:
	if team_component.team == 2:
		unit_spawn_area.position.x *= -1

func get_random_spawn_point() -> Vector2:
	var spawn_area: Rect2 = unit_spawn_area.shape.get_rect()
	var x = randi_range(spawn_area.position.x, spawn_area.end.x)
	var y = randi_range(spawn_area.position.y, spawn_area.end.y)
	var offset = - Vector2(x,y) + Vector2(spawn_area.size.x*3,40) if team_component.team == 1 else -Vector2(x,y) - Vector2(spawn_area.size.x*3,-40)
	return global_position + offset

func _on_health_change() -> void:
	if health_component == null:
		return
	if health_component.current_health <= health_component.max_health/2 and not health_below_half:
		give_modifier.emit(team_component.team)
		health_below_half = true
