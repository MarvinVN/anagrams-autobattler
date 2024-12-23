class_name ModifierManager
extends Node

@onready var timer: Timer = $Timer
@onready var modifier_panel: ModifierPanel = $"../ModifierPanel"

@export var letters_manager: LettersManager
@export var audio_manager: AudioManager

const ADD_LETTER_DURATION: float = 20.0
const FREEZE_DURATION: float = 10.0
const LOCK_DURATION: float = 20.0
const WILD_CARD_DURATION: float = 20.0

var affected_player: InputManager
var previous_states: Array

func _process(delta: float) -> void:
	if not timer.is_stopped():
		modifier_panel.update_timer_progress_bar(timer.time_left, timer.wait_time)

func use_modifier(player: InputManager, modifier: int) -> void:
	if not timer.is_stopped():
		print("modifier already in use!")
		return
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
	var wild_tile = letters_manager.get_wild_card_tile()
	if wild_tile:
		affected_player.on_wild_card_timeout(wild_tile)
	if affected_player.letters_manager.is_letters_frozen():
		letters_manager.update_all_tile_states_by_list(previous_states)
		previous_states.clear()
	else:
		affected_player.letters_manager.clear_tile_modifiers()
	affected_player = null
	modifier_panel.hide_panel()
	letters_manager.reset_all_tile_sprites()

# TODO: do in own ticket
func use_add_letter_mod() -> void:
	print("add letter")
	pass

# TODO: currently affects user, make affect the other player
func use_freeze_mod() -> void:
	previous_states = affected_player.letters_manager.get_all_tile_states()
	letters_manager.update_all_tile_states(Enums.TileStates.FROZEN)
	timer.wait_time = FREEZE_DURATION
	modifier_panel.update_modifier_text("FREEZE LETTERS")
	audio_manager.play_freeze_mod()

# TODO: currently affects user, make affect the other player
func use_lock_mod() -> void:
	letters_manager.update_tile_state(letters_manager.get_random_tile(), Enums.TileStates.LOCKED)
	timer.wait_time = LOCK_DURATION
	modifier_panel.update_modifier_text("LOCK LETTER")

func use_wild_card_mod() -> void:
	var wild_tile = letters_manager.get_random_tile()
	letters_manager.update_tile_state(wild_tile, Enums.TileStates.WILD)
	timer.wait_time = WILD_CARD_DURATION
	modifier_panel.update_modifier_text("WILD CARD")
	wild_tile.set_sprite("wild")

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
