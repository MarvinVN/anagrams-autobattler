class_name Base
extends Area2D

@export var unit_spawn_area: CollisionShape2D

@onready var health_component := $HealthComponent
@onready var hitbox_component := $HitboxComponent
@onready var team_component := $TeamComponent

func _ready() -> void:
	if team_component.team == 2:
		unit_spawn_area.position.x *= -1

func get_random_spawn_point() -> Vector2:
	var spawn_area: Rect2 = unit_spawn_area.shape.get_rect()
	var x = randi_range(spawn_area.position.x, spawn_area.end.x)
	var y = randi_range(spawn_area.position.y, spawn_area.end.y)
	var offset = - Vector2(x,y) + Vector2(spawn_area.size.x*3,40) if team_component.team == 1 else -Vector2(x,y) - Vector2(spawn_area.size.x*3,-40)
	return global_position + offset
