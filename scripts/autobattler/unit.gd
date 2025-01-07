class_name Unit
extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

@onready var attack_component: AttackComponent = $AttackComponent
@onready var health_component: HealthComponent = $HealthComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var pathfind_component: PathfindComponent = $PathfindComponent
@onready var team_component: TeamComponent = $TeamComponent
@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var vision_component: VisionComponent = $VisionComponent

const VISION_TIMEOUT = 1

var current_target

func _ready() -> void:
	timer.timeout.connect(self._on_timer_timeout)
	timer.start(VISION_TIMEOUT)

func _on_timer_timeout():
	current_target = vision_component.get_nearest_enemy_entity()
	if current_target:
		pathfind_component.set_target_position(current_target.global_position)
