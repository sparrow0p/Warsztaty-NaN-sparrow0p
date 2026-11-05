extends State
class_name IdleState


@export_range(1, 3000, 1, "suffix:px/s^2") var deceleration: float = 1800


func physics_process(delta: float) -> void:
	if character.direction:
		state_machine.change_state("MoveState")
		return
	
	character.velocity = character.velocity.move_toward(Vector2.ZERO, deceleration * delta)
