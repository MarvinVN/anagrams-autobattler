class_name VelocityComponent
extends Node

@onready var parent_obj := get_parent()

@export var speed: float

var velocity: Vector2

func move(character: CharacterBody2D) -> void:
	character.velocity = velocity
	character.move_and_slide()
	handle_direction()

func handle_direction() -> void:
	var parent_sprite = parent_obj.sprite
	var parent_attack_area = parent_obj.attack_component.attack_area
	var should_flip := false
	
	if velocity.x != 0:
		should_flip = velocity.x < 0
		if parent_sprite.flip_h != should_flip:
			parent_sprite.flip_h = should_flip
		if (velocity.x < 0 and parent_attack_area.position.x > 0) or (velocity.x > 0 and parent_attack_area.position.x < 0):
			parent_attack_area.position.x *= -1

func set_velocity(direction: Vector2) -> void:
	velocity = direction * speed
