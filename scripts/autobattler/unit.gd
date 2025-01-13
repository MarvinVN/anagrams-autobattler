class_name Unit
extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
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
	find_target()
	timer.timeout.connect(self._on_timer_timeout)
	timer.start(VISION_TIMEOUT)

func find_target() -> void:
	current_target = vision_component.get_nearest_enemy_entity()
	if current_target:
		pathfind_component.set_target_position(current_target.global_position)
	else:
		pathfind_component.set_target_position(team_component.enemy_base_pos)

func flip_direction() -> void:
	sprite.flip_h = true
	attack_component.attack_area.position.x *= -1

func switch_sprite() -> void:
	sprite.texture = load("res://assets/Tiny Swords/Factions/Knights/Troops/Dead/Dead.png")
	sprite.hframes = 7
	sprite.vframes = 2

func _on_timer_timeout():
	find_target()

func _on_health_below_zero() -> void:
	switch_sprite()
