class_name UnitMarchState
extends UnitState

func enter() -> void:
	unit.animated_sprite.play("blue_pawn_walk")

func update(delta: float) -> void:
	if unit.current_target:
		state_transition.emit(self, "Pursuit")

func physics_update(delta: float) -> void:
	if NavigationServer2D.map_get_iteration_id(unit.pathfind_component.nav_agent.get_navigation_map()) == 0:
		return
	move_to_target_pos(delta)
