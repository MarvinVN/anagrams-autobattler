class_name TeamComponent
extends Node

enum teams {
	TEAM_1 = 1,
	TEAM_2 = 2
}

var base_positions = {
	TEAM_1 = Vector2(-25,414),
	TEAM_2 = Vector2(1180,414)
}

@export var team: teams:
	set(new_team):
		team = new_team
		enemy_base_pos = base_positions["TEAM_2"] if new_team == 1 else base_positions["TEAM_1"]

var enemy_base_pos: Vector2
