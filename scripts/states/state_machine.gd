class_name StateMachine
extends Node

@export var initial_state: State

var current_state: State
var states: Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.state_transition.connect(_on_child_transition)

	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta: float):
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float):
	if current_state:
		current_state.physics_update(delta)

func _on_child_transition(state: State, new_state_name: String):
	if state != current_state:
		return

	var new_state: State = states.get(new_state_name)
	if !new_state:
		current_state.exit()

	new_state.enter()
	current_state = new_state
	
	print("now in new state: %s" % current_state.name)
