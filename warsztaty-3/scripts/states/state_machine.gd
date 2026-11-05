extends Node
class_name StateMachine


@export var current_state: State = null

var states: Dictionary = {}
var character: StateMachineCharacter


func setup_state_machine(parent: CharacterBody2D):
	character = parent
	
	for state in get_children() as Array[State]:
		states[state.name] = state
		state.state_machine = self
		state.character = parent
		
		if state == current_state:
			state.enter()


func _input(event: InputEvent) -> void:
	if current_state:
		current_state.input(event)


func _process(delta: float) -> void:
	if current_state:
		current_state.process(delta)


func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_process(delta)
	
	character.move_and_slide()


func change_state(state_name: String):
	if current_state is DeadState:
		return
	
	if current_state:
		current_state.exit()
	
	current_state = states[state_name]
	
	current_state.enter()
