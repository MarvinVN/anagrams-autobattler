class_name ModifierManager
extends Node

@onready var timer: Timer = $Timer
@onready var modifier_panel: ModifierPanel = $"../ModifierPanel"
@export var letters_manager: LettersManager

const ADD_LETTER_DURATION: float = 20.0
const FREEZE_DURATION: float = 10.0
const LOCK_DURATION: float = 20.0
const WILD_CARD_DURATION: float = 20.0

var affected_player: InputManager

func _process(delta: float) -> void:
	if not timer.is_stopped():
		modifier_panel.update_timer_progress_bar(timer.time_left, timer.wait_time)

func use_modifier(player: InputManager, modifier: int) -> void:
	affected_player = player
	match modifier:
		Enums.Modifiers.ADD_LETTER: use_add_letter_mod()
		Enums.Modifiers.FREEZE: use_freeze_mod()
		Enums.Modifiers.LOCK: use_lock_mod()
		Enums.Modifiers.WILD_CARD: use_wild_card_mod()
	timer.start()
	modifier_panel.show_panel()

func clear_modifier() -> void:
	timer.stop()
	affected_player.letters_manager.clear_tile_modifiers()
	affected_player = null
	modifier_panel.hide_panel()

# TODO: do in own ticket
func use_add_letter_mod() -> void:
	print("add letter")
	pass

# TODO: currently affects user, make affect the other player
func use_freeze_mod() -> void:
	print("freeze")
	pass

# TODO: currently affects user, make affect the other player
func use_lock_mod() -> void:
	letters_manager.update_tile_state(letters_manager.get_random_tile(), Enums.TileStates.LOCKED)
	timer.wait_time = LOCK_DURATION
	modifier_panel.update_modifier_text("LOCK LETTER")

func use_wild_card_mod() -> void:
	print("wild card")
	pass

func give_random_mod(player: InputManager) -> void:
	player.current_modifier = Enums.Modifiers.values().pick_random()

func give_add_letter_mod(player: InputManager) -> void:
	player.current_modifier = Enums.Modifiers.ADD_LETTER

func give_freeze_mod(player: InputManager) -> void:
	player.current_modifier = Enums.Modifiers.FREEZE

func give_lock_mod(player: InputManager) -> void:
	player.current_modifier = Enums.Modifiers.LOCK

func give_wild_card_mod(player: InputManager) -> void:
	player.current_modifier = Enums.Modifiers.WILD_CARD

func _on_timer_timeout() -> void:
	clear_modifier()
