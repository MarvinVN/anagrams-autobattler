class_name Pawn
extends Unit

const PAWN_HEALTH = 30
const PAWN_DAMAGE = 10
const PAWN_SIGHT_RANGE = 50
const PAWN_ATTACK_RANGE = 10
const PAWN_MOVE_SPEED = 10

func _init() -> void:
	super._init(PAWN_HEALTH, PAWN_DAMAGE, PAWN_SIGHT_RANGE, PAWN_ATTACK_RANGE, PAWN_MOVE_SPEED)
