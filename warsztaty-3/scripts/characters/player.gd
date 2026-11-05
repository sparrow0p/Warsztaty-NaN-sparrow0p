extends StateMachineCharacter
class_name Player


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("x"):
		if state_machine.current_state.name != "AttackState":
			state_machine.change_state("AttackState")


func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		last_direction = direction
