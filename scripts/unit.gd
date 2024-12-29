class_name Unit
extends Node

var health: float
var damage: float
var sight_range: float
var attack_range: float
var move_speed: float

func _init(health: float, damage: float, sight_range: float, attack_range: float, move_speed: float):
	self.health = health
	self.damage = damage
	self.sight_range = sight_range
	self.attack_range = attack_range
	self.move_speed = move_speed
