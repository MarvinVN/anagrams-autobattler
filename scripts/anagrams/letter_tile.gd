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
	if state == Enums.TileStates.USED:
		state = Enums.TileStates.AVAILABLE
	if state in [Enums.TileStates.WILD, Enums.TileStates.WILD_USED]:
		if state == Enums.TileStates.WILD_USED:
			state = Enums.TileStates.WILD
	else:
		set_sprite()

func set_sprite(sprite_name: String = self.letter):
	sprite.texture = letters_manager.letter_sprites.get(sprite_name)
	sprite.scale = Vector2(1.5, 1.5)
