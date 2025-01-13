class_name UnitIdleState
extends UnitState

var timer: Timer

func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(self.start_march)

func enter() -> void:
	if unit.current_target:
		state_transition.emit(self, "Pursuit")
	await unit.ready
	unit.animation_player.play("idle")
	timer.start(1)

func update(delta: float) -> void:
	if unit.health_component.is_dead():
		state_transition.emit(self, "Death")
	if unit.current_target:
		state_transition.emit(self, "Pursuit")
	if timer.is_stopped():
		timer.start(1)

func start_march() -> void:
	unit.pathfind_component.set_target_position(unit.team_component.enemy_base_pos)
	timer.stop()
	state_transition.emit(self, "March")
