class_name Unit
extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

@onready var health_component: HealthComponent = $HealthComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var pathfind_component: PathfindComponent = $PathfindComponent
@onready var team_component: TeamComponent = $TeamComponent
@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var vision_component: VisionComponent = $VisionComponent

const VISION_TIMEOUT = 1

var damage: float
var sight_range: float
var attack_range: float
var move_speed: float

var current_target

func _init(damage: float, sight_range: float, attack_range: float):
	self.damage = damage
	self.sight_range = sight_range
	self.attack_range = attack_range
	self.move_speed = move_speed

func _ready() -> void:
	timer.timeout.connect(self._on_timer_timeout)
	timer.start(VISION_TIMEOUT)

func _on_timer_timeout():
	current_target = vision_component.get_nearest_enemy_entity()
	if current_target:
		pathfind_component.set_target_position(current_target.global_position)
