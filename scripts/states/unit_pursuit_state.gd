class_name UnitPursuitState
extends UnitState

func enter() -> void:
	unit.animation_player.play("walk")

func update(delta: float) -> void:
	if unit.current_target == null:
		state_transition.emit(self, "Idle")
		return
	if unit.attack_component.is_target_in_range(unit.current_target):
		state_transition.emit(self, "Attack")

func physics_update(delta: float) -> void:
	if NavigationServer2D.map_get_iteration_id(unit.pathfind_component.nav_agent.get_navigation_map()) == 0:
		return
	move_to_target_pos(delta)
