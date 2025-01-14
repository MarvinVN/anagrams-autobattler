class_name UnitDeathState
extends UnitState

var timer: Timer

func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(self.free_unit)

func enter() -> void:
	unit.animation_player.play("death")
	unit.collision.disabled = true
	timer.start(5)

func free_unit() -> void:
	unit.animation_player.play("free")
	await unit.animation_player.animation_finished
	unit.queue_free()
