class_name Archer
extends Unit

@onready var bow_sprite: Sprite2D = $BowSprite
@onready var bow_animation_player: AnimationPlayer = $BowAnimationPlayer

const BODY_TO_BOW := {
	"attack1": "attack",
	"attack2": "attack",
	"walk": "walk",
	"idle": "idle",
}

func _process(_delta: float) -> void:
	sync_bow_animation()

func sync_bow_animation() -> void:
	if health_component.is_dead():
		return
	var bow_anim = BODY_TO_BOW.get(animation_player.current_animation)
	if bow_anim and bow_animation_player.current_animation != bow_anim:
		bow_animation_player.play(bow_anim)

func flip_direction() -> void:
	sprite.flip_h = true
	bow_sprite.flip_h = true

func _on_health_below_zero() -> void:
	super()
	bow_sprite.hide()
