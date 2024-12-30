class_name UnitIdleState
extends UnitState

var timer: Timer

func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(self.start_march)

func enter() -> void:
	await unit.ready
	unit.animated_sprite.play("blue_pawn_idle")
	timer.start(1)

func start_march() -> void:
	unit.pathfind_component.set_target_position(unit.team_component.enemy_base_pos)
	timer.stop()
	state_transition.emit(self, "March")
