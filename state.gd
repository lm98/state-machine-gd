class_name State extends Node

signal Transitioned(state: State, new_state_name: String, args: Dictionary)

func enter(args: Dictionary):
	pass

func exit():
	pass

func update(delta):
	pass

func physics_update(delta):
	pass
