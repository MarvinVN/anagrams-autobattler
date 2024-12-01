class_name LetterTile
extends Node2D

@onready var letters_manager: LettersManager = $".."
@onready var sprite: Sprite2D = $Sprite2D

@export var letter: String
@export var state: int
var letter_set_position: Vector2

func _init() -> void:
	sprite = Sprite2D.new()

func set_letter(new_letter: String) -> void:
	if new_letter.to_upper() not in Enums.Letters:
		print("invalid letter")
		return
	letter = new_letter
	state = Enums.TileStates.AVAILABLE
	sprite.texture = letters_manager.letter_sprites.get(letter)
	sprite.scale = Vector2(1.5, 1.5)
