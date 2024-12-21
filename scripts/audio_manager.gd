class_name AudioManager
extends Node

@export var audio_input: AudioStreamPlayer
@export var audio_invalid: AudioStreamPlayer
@export var audio_valid_word: AudioStreamPlayer
@export var audio_shuffle: AudioStreamPlayer
@export var audio_lock_mod: AudioStreamPlayer
@export var audio_use_locked_letter: AudioStreamPlayer
@export var audio_freeze_mod: AudioStreamPlayer
@export var audio_use_frozen_letter: AudioStreamPlayer
@export var audio_wildcard_mod: AudioStreamPlayer

func play_input() -> void:
	audio_input.play()

func play_invalid() -> void:
	audio_invalid.play()

func play_valid_word() -> void:
	audio_valid_word.play()

func play_shuffle() -> void:
	audio_shuffle.play()

func play_lock_mod() -> void:
	audio_lock_mod.play()

func play_use_locked_letter() -> void:
	audio_use_locked_letter.play()

func play_freeze_mod() -> void:
	audio_freeze_mod.play()

func play_use_frozen_letter() -> void:
	audio_use_frozen_letter.play()

func play_wildcard_mod() -> void:
	audio_wildcard_mod.play()
