class_name PathfindComponent
extends Node2D

@onready var parent_obj := get_parent()
@export var velocity_component: VelocityComponent

var nav_agent: NavigationAgent2D

func _ready() -> void:
	nav_agent = NavigationAgent2D.new()
	add_child(nav_agent)

func set_target_position(target_pos: Vector2) -> void:
	nav_agent.target_position = target_pos

func follow_path(delta) -> void:
	var next_path_pos = nav_agent.get_next_path_position()
	var direction = parent_obj.global_position.direction_to(next_path_pos)
	velocity_component.set_velocity(direction*delta)
	nav_agent.velocity = velocity_component.velocity
