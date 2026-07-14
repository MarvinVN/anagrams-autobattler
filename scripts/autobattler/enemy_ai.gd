class_name EnemyAI
extends Node

const ENEMY_TEAM := 2

# Word lengths that map to spawnable unit types (see UnitManager.spawn_unit).
const UNIT_WORD_LENGTHS := [3, 4, 5, 6]

@export var unit_manager: UnitManager

## Seconds between spawns at the start of a match.
@export var start_interval: float = 6.0
## Fastest the AI will ever spawn.
@export var min_interval: float = 2.0
## Seconds shaved off the spawn interval after each spawn (difficulty ramp).
@export var interval_step: float = 0.25

@onready var timer: Timer = $Timer

var current_interval: float = 0.0

func _ready() -> void:
	current_interval = start_interval
	timer.timeout.connect(_on_timer_timeout)
	timer.start(current_interval)

func spawn_wave_unit() -> void:
	if unit_manager == null:
		return
	var word_length: int = UNIT_WORD_LENGTHS.pick_random()
	unit_manager.spawn_unit(word_length, ENEMY_TEAM)

func _on_timer_timeout() -> void:
	spawn_wave_unit()
	current_interval = max(min_interval, current_interval - interval_step)
	timer.start(current_interval)
