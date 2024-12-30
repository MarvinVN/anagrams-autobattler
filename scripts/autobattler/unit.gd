class_name Unit
extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var pathfind_component: PathfindComponent = $PathfindComponent
@onready var team_component: TeamComponent = $TeamComponent
@onready var velocity_component: VelocityComponent = $VelocityComponent

var damage: float
var sight_range: float
var attack_range: float
var move_speed: float

func _init(damage: float, sight_range: float, attack_range: float):
	self.damage = damage
	self.sight_range = sight_range
	self.attack_range = attack_range
	self.move_speed = move_speed
