class_name LetterTile
extends Node2D

@onready var sprite: Sprite2D = $Sprite2D

var letter: String
var letter_sprites: Dictionary

func _init() -> void:
	sprite = Sprite2D.new()
	init_letter_sprites()

func set_letter(new_letter: String) -> void:
	if new_letter.to_upper() not in Enums.Letters:
		print("invalid letter")
		return
	letter = new_letter
	sprite.texture = letter_sprites.get(letter)

func init_letter_sprites() -> void:
	letter_sprites = {
		"a": preload("res://assets/tiles/a-tile.png"),
		"b": preload("res://assets/tiles/b-tile.png"),
		"c": preload("res://assets/tiles/c-tile.png"),
		"d": preload("res://assets/tiles/d-tile.png"),
		"e": preload("res://assets/tiles/e-tile.png"),
		"f": preload("res://assets/tiles/f-tile.png"),
		"g": preload("res://assets/tiles/g-tile.png"),
		"h": preload("res://assets/tiles/h-tile.png"),
		"i": preload("res://assets/tiles/i-tile.png"),
		"j": preload("res://assets/tiles/j-tile.png"),
		"k": preload("res://assets/tiles/k-tile.png"),
		"l": preload("res://assets/tiles/l-tile.png"),
		"m": preload("res://assets/tiles/m-tile.png"),
		"n": preload("res://assets/tiles/n-tile.png"),
		"o": preload("res://assets/tiles/o-tile.png"),
		"p": preload("res://assets/tiles/p-tile.png"),
		"q": preload("res://assets/tiles/q-tile.png"),
		"r": preload("res://assets/tiles/r-tile.png"),
		"s": preload("res://assets/tiles/s-tile.png"),
		"t": preload("res://assets/tiles/t-tile.png"),
		"u": preload("res://assets/tiles/u-tile.png"),
		"v": preload("res://assets/tiles/v-tile.png"),
		"w": preload("res://assets/tiles/w-tile.png"),
		"x": preload("res://assets/tiles/x-tile.png"),
		"y": preload("res://assets/tiles/y-tile.png"),
		"z": preload("res://assets/tiles/z-tile.png"),
		"wild": preload("res://assets/tiles/wild-tile.png"),
		"smile": preload("res://assets/tiles/smile-tile.png"),
		"empty": preload("res://assets/tiles/empty-tile.png"),
		null: preload("res://assets/tiles/empty-tile.png")
	}
