class_name Unit
extends Node

@onready var health_component: HealthComponent = $HealthComponent

var damage: float
var sight_range: float
var attack_range: float
var move_speed: float

func _init(damage: float, sight_range: float, attack_range: float, move_speed: float):
	self.damage = damage
	self.sight_range = sight_range
	self.attack_range = attack_range
	self.move_speed = move_speed
