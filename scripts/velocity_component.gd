class_name VelocityComponent
extends Node

@export var speed: float

var velocity: Vector2

func move(character: CharacterBody2D) -> void:
	character.velocity = velocity
	character.move_and_slide()

func set_velocity(direction: Vector2) -> void:
	velocity = direction * speed
