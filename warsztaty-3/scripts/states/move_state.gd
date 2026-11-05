extends State
class_name MoveState


@export_range(1, 300, 1, "suffix:px/s") var speed: float = 120
@export_range(1, 3000, 1, "suffix:px/s^2") var acceleration: float = 1700


func physics_process(delta: float) -> void:
	var direction: Vector2 = character.direction
	
	if direction:
		character.velocity = character.velocity.move_toward(direction * speed, acceleration * delta)
		if direction.x:
			character.sprite.flip_h = direction.x < 0.0
	else:
		state_machine.change_state("IdleState")
