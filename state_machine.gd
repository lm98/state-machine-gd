extends Node

@export var initial_state: State

var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)

	if initial_state:
		initial_state.enter({})
		current_state = initial_state

func _process(delta) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func on_child_transition(state: State, new_state_name: String, args: Dictionary):
	if current_state == state:
		var new_state: State = states.get(new_state_name.to_lower())
		if !new_state:
			return

		current_state.exit()

		new_state.enter(args)
		current_state = new_state
