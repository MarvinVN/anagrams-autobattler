class_name UnitAttackState
extends UnitState

var animations = ["attack1", "attack2"]
var is_attacking := false
var current_animation: StringName

func enter() -> void:
	attack()

func attack() -> void:
	randomize_animation()
	unit.attack_component.attack()

func randomize_animation() -> void:
	current_animation = animations.pick_random()
	unit.animation_player.play(current_animation)
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name in animations:
		attack()
